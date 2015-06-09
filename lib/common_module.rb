module CommonModule
  class << self
    
    CATALOG_NUMBER_LEN = AppConfig.catalog_number_len
    MANUFACTURER_LEN = AppConfig.manufacturer_len

    def get_emex(input)
      # TODO тут нужна оптимизация, например, когда нас спрашивают о заменах, нам неважно какой логин и пароль, или если спрашивают информацию о заменах конкретного производителя и у нас уже есть кеш с каталожным номером, но без производителя, то мы сами можем это все вычленять. Пока что кеш максимально жесткий, чтобы во-первых не допустить ошибки и во-вторых не тратить много время

      result = ''
      hash = Hash.new
      file_name = 'system/emex/'
      file_name << safe_name(input[:catalog_number].to_s) + "|" + safe_name(input[:manufacturer].to_s) + "|" + safe_name(input[:replacements].to_i.to_s)

      if (input[:cached] && File.exist?(file_name)) || ( File.exist?(file_name) && (File.ctime(file_name) > Time.now - AppConfig.emex_cache.to_i.minutes))
        result = File.read(file_name)
      else
        hash['makeLogo'] = input[:manufacturer].present? ? CommonModule::manufacturer_orig(input[:manufacturer])[1..-2] : ''
        hash['detailNum'] = CommonModule::catalog_number_orig(input[:catalog_number])
        hash['login'] = input[:login]
        hash['password'] = input[:password]
        hash['findSubstitutes'] = input[:replacements] == '1' ? 'true' : 'false'
debugger
        response = Net::HTTP.post_form(URI.parse('http://ws.emex.ru/EmExService.asmx/FindDetailAdv2'), hash)
        if response.code == '200'
          file = File.new(file_name, "w")
          result = response.body
          file.write(result)
          file.close
        end
      end

      result

    end


    def add_doublet(job_id)
      query = "UPDATE price_import_#{job_id} SET doublet = SUBSTRING(MD5(catalog_number), 1, 2)"
      Price.connection.execute(query)

      query = "ALTER TABLE price_import_#{job_id} ADD INDEX doublet_idx (doublet)"
      Price.connection.execute(query)
    end

    def all_doublets
      alpha_numerics = ('0'..'9').to_a + ('a'..'f').to_a
      alpha_numerics.product(alpha_numerics).map{ |doublet| doublet.join ''}.shuffle.each do |l| 
        yield l
      end 
    end

    def catalog_number_orig catalog_number
      catalog_number.to_s.mb_chars.strip[0, CATALOG_NUMBER_LEN].to_s
    end

    def manufacturer_orig manufacturer
      if(manufacturer = manufacturer.to_s.mb_chars.strip[0, MANUFACTURER_LEN].to_s).length > 0
        return ActiveRecord::Base.connection.quote(manufacturer)
      else
        return "NULL"
      end
    end

    def normalize_catalog_number catalog_number
      cn = catalog_number.to_s.mb_chars.upcase.strip.gsub(/[^А-ЯA-Z0-9]/i, '')[0, CATALOG_NUMBER_LEN].to_s
      if cn.length > 0
        return cn
      else
        raise CatalogNumberException, "Введен ошибочный каталожный номер детали, номер может содержать только буквы латинского или русского алфавита и цифры, вы ввели '#{catalog_number}'"
      end
    end

  def create_manufacturer_and_synonym(manufacturer_orig, job_id)
    
    m = Manufacturer.where(:title => manufacturer_orig).first
    ms = ManufacturerSynonym.where(:title => manufacturer_orig).first

    if m.blank?
      m = Manufacturer.create(:title => manufacturer_orig, :job_id => job_id)
    end

    if ms.blank?
      ms = ManufacturerSynonym.create(:title => manufacturer_orig, :job_id => job_id)
    end

    ms.manufacturer = m
    ms.save
  end
  
  def get_manufacturer_by_synonym()

  end

    def find_manufacturer_synonym(manufacturer_orig, job_id, allow_to_create = true)
      if (manufacturer_orig = manufacturer_orig.to_s.mb_chars.strip.upcase.to_s).length > 0
        manufacturer_orig = manufacturer_orig[0, MANUFACTURER_LEN]

        # Выполняем единожды для всех обрабтываемых файлов
        unless defined? @manufacturer_synonyms_hs
          @manufacturer_synonyms_hs = Hash.new
          @used_in_this_price = Hash.new
          manufacturer_synonyms_ar = ManufacturerSynonym.includes(:manufacturer).select('manufacturers.id, manufacturers.title, manufacturer_synonyms.title')
          manufacturer_synonyms_ar.each do |ms|
            unless ms.manufacturer.nil?
              # Заполняем хеш таблицу, где ключ - ManufacturerSynonym, а значение Manufacturer.
              # Т.е. под одним ключем ManufacturerSynonym может быть несколько Manufacturer'ов
              @manufacturer_synonyms_hs[ms.title.to_s] = ms.manufacturer.title.to_s
            else
              # Удалим ManufacturerSynonym, если у него нет ни одного Manufacturer'a
              ManufacturerSynonym.delete(ms.id)
            end
          end
          manufacturer_synonyms_ar = nil
        end

        # если встретили этот синоним в прайсе впервые
        unless manufacturer = @used_in_this_price[manufacturer_orig]
          # если не нашли в глобальной таблице соответствия синонимов и производителей
          unless manufacturer = @manufacturer_synonyms_hs[manufacturer_orig]
            # Если мы имеем право создать, то пробуем
            if allow_to_create
              unless create_manufacturer_and_synonym(manufacturer_orig, job_id)
                # возможна ситуация, в случае Race condition
                unless create_manufacturer_and_synonym(manufacturer_orig, job_id)
                  raise 'Не восстановимая ошибка при создании производителей/синонимов. Задача должна разрешиться при следующем запуске'
                end
              end
            else
              raise ManufacturerException, "Введен не существующий производитель деталей '#{manufacturer_orig}'"
            end

            manufacturer = manufacturer_orig
          end
          # обновляем, что синоним встречался в прайсе ранее из найденного в глобальной таблице, или нового созданного
          @used_in_this_price[manufacturer_orig] = manufacturer
        end
        return ActiveRecord::Base.connection.quote(manufacturer)
      else
        return "NULL"
      end
    end

    def prepare_insertion_table(job_id)
      Price.connection.execute("DROP TABLE IF EXISTS price_import_#{job_id}")
      Price.connection.execute("CREATE TABLE price_import_#{job_id} like price_import_templates")
    end

    def deep_symbolize_keys arg
      case arg
        when Array
          arg.map { |elem| deep_symbolize_keys elem }
        when Hash
          Hash[
            arg.map { |key, value|  
              k = key.is_a?(String) ? key.to_sym : key
              v = deep_symbolize_keys value
              [k,v]
          }]
        else
          symbolize_keys arg
        end
      end


      private 
      def safe_name unsafe_name
        unsafe_name.gsub(/[^0-9A-Za-zА-Яа-я.\-]/, '_').to_s
      end

    end
end
