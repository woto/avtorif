module CommonModule
  class << self
    
    CATALOG_NUMBER_LEN = AppConfig.catalog_number_len

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
      catalog_number.to_s.mb_chars.upcase.strip[0, CATALOG_NUMBER_LEN].gsub(/[^a-z0-9]/i, '').to_s
    end

  def create_manufacturer_and_synonym(manufacturer_orig, job_id)
    if manufacturer_orig == "K"
      debugger
    end
    
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

    def find_manufacturer_synonym(manufacturer_orig, job_id)
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
            # то надо создавать
            unless create_manufacturer_and_synonym(manufacturer_orig, job_id)
              debugger
              # возможна ситуация, в случае Race condition
              unless create_manufacturer_and_synonym(manufacturer_orig, job_id)
                raise 'Не восстановимая ошибка при создании производителей/синонимов. Задача должна разрешиться при следующем запуске'
              end
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
