module CommonModule
  class << self
    
    CATALOG_NUMBER_LEN = AppConfig.catalog_number_len

    def get_emex(input)
      # TODO тут нужна оптимизация, например, когда нас спрашивают о заменах, нам неважно какой логин и пароль, или если спрашивают информацию о заменах конкретного производителя и у нас уже есть кеш с каталожным номером, но без производителя, то мы сами можем это все вычленять. Пока что кеш максимально жесткий, чтобы во-первых не допустить ошибки и во-вторых не тратить много время

      hash = Hash.new
      file_name = 'system/emex/'
      file_name << input[:login].to_s + "|" + input[:password].to_s + "|" + input[:catalog_number].to_s + "|" + input[:manufacturer].to_s + "|" + input[:replacements].to_i.to_s

      if(File.exist?(file_name) && (File.ctime(file_name) > Time.now - AppConfig.emex_cache.to_i.minutes))
        result = File.read(file_name)
      else
        hash['makeLogo'] = input[:manufacturer] ? input[:manufacturer] : ''
        hash['detailNum'] = CommonModule::catalog_number_orig(input[:catalog_number])
        hash['login'] = input[:login]
        hash['password'] = input[:password]
        hash['findSubstitutes'] = input[:replacements] == '1' ? 'true' : 'false'
        response = Net::HTTP.post_form(URI.parse('http://ws.emex.ru/EmExService.asmx/FindDetailAdv'), hash)
        file = File.new(file_name, "w")
        result = response.body
        file.write(result)
        file.close
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

    CYR_LAT_LOWER = {'й' => 'q', 'ц' => 'w', 'у' => 'e', 'к' => 'r', 'е' => 't', 'н' => 'y', 'г' => 'u', 'ш' => 'i', 'щ' => 'o', 'з' => 'p', 'ф' => 'a', 'ы' => 's', 'в' => 'd', 'а' => 'f', 'п' => 'g', 'р' => 'h', 'о' => 'j', 'л' => 'k', 'д' => 'l', 'я' => 'z', 'ч' => 'x', 'с' => 'c', 'м' => 'v', 'и' => 'b', 'т' => 'n', 'ь' => 'm'}.sort{|one, two| two[1].size <=> one[1].size}

    CYR_LAT_UPPER = {'Й' => 'Q', 'Ц' => 'W', 'У' => 'E', 'К' => 'R', 'Е' => 'T', 'Н' => 'Y', 'Г' => 'U', 'Ш' => 'I', 'Щ' => 'O', 'З' => 'P', 'Ф' => 'A', 'Ы' => 'S', 'В' => 'D', 'А' => 'F', 'П' => 'G', 'Р' => 'H', 'О' => 'J', 'Л' => 'K', 'Д' => 'L', 'Я' => 'Z', 'Ч' => 'X', 'С' => 'C', 'М' => 'V', 'И' => 'B', 'Т' => 'N', 'Ь' => 'M'}.sort{|one, two| two[1].size <=> one[1].size}

    TABLE = CYR_LAT_LOWER + CYR_LAT_UPPER

    def convert_all_cyr_to_lat(str)
      chars = str.split(//)

      lowers = CYR_LAT_LOWER.map{|e| e[0] }
      uppers = CYR_LAT_UPPER.map{|e| e[0] }

      hashtable = {}
      TABLE.each do |item|
        next unless item[0] && item[1]
        hashtable[item[0]] = item[1]
      end

      result = ''
      chars.each_with_index do | char, index |
        if uppers.include?(char) && lowers.include?(chars[index+1])
          # Combined case. Here we deal with Latin letters so there is no problem to use
          # Ruby's builtin upcase_downcase
          ch = hashtable[char].downcase.capitalize
          result << ch
        elsif uppers.include?(char)
          result << hashtable[char]
        elsif lowers.include?(char)
          result << hashtable[char]
        else
          result << char
        end
      end
      return result
    end

    def catalog_number_orig catalog_number
      @catalog_number_len ||= AppConfig.catalog_number_len
      catalog_number.to_s.mb_chars[0, @catalog_number_len].strip.to_s
    end

    def manufacturer_orig manufacturer
      if(manufacturer = manufacturer.to_s.mb_chars.strip.to_s).length > 0
        @manufacturer_len ||= AppConfig.manufacturer_len
        return ActiveRecord::Base.connection.quote(manufacturer[0, @manufacturer_len].to_s)
      else
        return "NULL"
      end
    end

    def normalize_catalog_number catalog_number
      cn = catalog_number.to_s.mb_chars.upcase.strip[0, CATALOG_NUMBER_LEN].gsub(/[^a-z0-9]/i, '').to_s
      if cn.length > 0
        return cn
      else
        raise CatalogNumberException
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
                debugger
                # возможна ситуация, в случае Race condition
                unless create_manufacturer_and_synonym(manufacturer_orig, job_id)
                  raise 'Не восстановимая ошибка при создании производителей/синонимов. Задача должна разрешиться при следующем запуске'
                end
              end
            else
              raise ManufacturerException
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

  end
end
