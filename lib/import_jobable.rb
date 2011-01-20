require 'digest/md5'

class ImportJobable < AbstractJobber

  def update_prices_costs

    if @jobable.job_code.present?
      CommonModule::all_prices_costs do |l|
        query = "
        UPDATE prices_#{@job.id} p 
          JOIN prices_costs_#{l} pc 
            ON  p.job_code = pc.job_code 
              AND p.catalog_number = pc.catalog_number 
              AND p.manufacturer_orig = pc.manufacturer_orig
          SET 
            p.processed = 1, 
            pc.price_cost = p.price_cost,
            pc.count = p.count
        WHERE p.doublet = '#{l}'"
        Price.connection.execute(query)
      end

    end
  end

  def move_to_prices_costs processed_condition = false
    additional = ""
    if processed_condition
      additional = " AND processed != 1"
    end

    CommonModule::all_prices_costs do |l|
      query = "INSERT INTO prices_costs_#{l} (job_id, title, count, price_cost, manufacturer, manufacturer_orig, catalog_number, title_en, unit_package, description, min_order, applicability, country, external_id, unit, multiply_factor, parts_group, job_code, supplier_id, doublet) SELECT job_id, title, count, price_cost, manufacturer, manufacturer_orig, catalog_number, title_en, unit_package, description, min_order, applicability, country, external_id, unit, multiply_factor, parts_group, job_code, supplier_id, doublet FROM prices_#{@job.id} WHERE doublet = '#{l}' #{additional}"
      Price.connection.execute(query)

      query = "UPDATE prices_#{@job.id} SET processed = 1 WHERE doublet = '#{l}'"
      Price.connection.execute(query)

    end
  end

  def CommonModule::all_prices_costs
    alpha_numerics = ('0'..'9').to_a + ('a'..'f').to_a
    alpha_numerics.product(alpha_numerics).map{ |doublet| doublet.join ''}.each do |l|
      yield l
    end
  end

  def normalize_catalog_number catalog_number
    catalog_number.to_s.mb_chars.upcase.strip.gsub(/[ ,-.]/, '').to_s
  end

  def make_insertion

    prepare_insertion_table

    @optional.each do |opt|
      i = 0
      query = ""
      manufacturer = manufacturer_orig = manufacturer_synonyms_hs = unit_colnum = multiply_factor_colnum = external_id_colnum = country_colnum = applicability_colnum =  min_order_colnum = description_colnum = unit_package_colnum = title_en_colnum = title_colnum = count_colnum = manufacturer_colnum = price_colnum = catalog_number_colnum = parts_group_colnum = false

      query_template = "INSERT INTO prices_#{@job.id} (job_id, "
      
      if @jobable.title_colnum.present?
        title_colnum = @jobable.title_colnum - 1
        query_template = query_template + "title, "
      end

      if @jobable.title_en_colnum.present?
        title_en_colnum = @jobable.title_en_colnum - 1
        query_template = query_template + "title_en, "
      end

      if @jobable.unit_package_colnum.present?
        unit_package_colnum = @jobable.unit_package_colnum - 1
        query_template = query_template + "unit_package, "
      end

      if @jobable.description_colnum.present?
        description_colnum = @jobable.description_colnum - 1
        query_template = query_template + "description, "
      end

      if @jobable.min_order_colnum.present?
        min_order_colnum = @jobable.min_order_colnum - 1
        query_template = query_template + "min_order, "
      end

      if @jobable.count_colnum.present?
        count_colnum = @jobable.count_colnum - 1
        query_template = query_template + "count, "
      end

      if @jobable.manufacturer_colnum.present?              
        manufacturer_colnum = @jobable.manufacturer_colnum - 1
        query_template = query_template + "manufacturer, manufacturer_orig, "
      end

      if @jobable.applicability_colnum.present?              
        applicability_colnum = @jobable.applicability_colnum - 1
        query_template = query_template + "applicability, "
      end

      if @jobable.multiply_factor_colnum.present?
        multiply_factor_colnum = @jobable.multiply_factor_colnum - 1
        query_template = query_template + "multiply_factor, "
      end

      if @jobable.unit_colnum.present?              
        unit_colnum = @jobable.unit_colnum - 1
        query_template = query_template + "unit, "
      end

      if @jobable.country_colnum.present?              
        country_colnum = @jobable.country_colnum - 1
        query_template = query_template + "country, "
      end

      if @jobable.external_id_colnum.present?              
        external_id_colnum = @jobable.external_id_colnum - 1
        query_template = query_template + "external_id, "
      end

      if @jobable.parts_group_colnum.present?              
        parts_group_colnum = @jobable.parts_group_colnum - 1
        query_template = query_template + "parts_group, "
      end

      if @jobable.job_code.present?              
        job_code = Price.connection.quote(@jobable.job_code) + ", "
        query_template = query_template + "job_code, "
      else
        job_code = ""
      end

      if manufacturer_colnum
        manufacturer_synonyms_ar = ManufacturerSynonym.includes(:manufacturer).select('manufacturers.id, manufacturers.title, manufacturer_synonyms.title')
        manufacturer_synonyms_hs = Hash.new
        manufacturer_synonyms_ar.each do |ms|
          begin
            manufacturer_synonyms_hs[ms.title.to_s.dup.to_s] = ms.manufacturer.title.to_s.mb_chars.strip.upcase.to_s
          rescue
            debugger
            puts '1'
          end
        end
        manufacturer_synonyms_ar = nil
      used_in_this_price = Hash.new
      end

      price_colnum = @jobable.income_price_colnum - 1
      catalog_number_colnum = @jobable.catalog_number_colnum - 1
      supplier_id = Price.connection.quote(@job.supplier_id)

      query_template = query_template + "price_cost, catalog_number, supplier_id, doublet) VALUES "

      #BUG Проверить, на работоспособность (Потребовалось после конвертирования из Excel в csv, где были переносы \r)
      FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
        #debugger
        if i == 0
          query = query_template
        end
        
        if i < 10

          query = query + "(#{@job.id},"

          query = query + title = title_colnum ? Price.connection.quote(row[title_colnum].to_s.strip) + ", " : ""
          query = query + title_en = title_en_colnum ? Price.connection.quote(row[title_en_colnum].to_s.strip) + ", " : ""
          query = query + unit_package = unit_package_colnum ? Price.connection.quote(row[unit_package_colnum].to_s.strip) + ", " : ""
          query = query + description = description_colnum ? Price.connection.quote(row[description_colnum].to_s.strip) + ", " : ""
          query = query + min_order = min_order_colnum ? Price.connection.quote(row[min_order_colnum].to_s.strip) + ", " : ""
          query = query + count = count_colnum ? Price.connection.quote(row[count_colnum].to_s.strip) + ", " : ""

          if manufacturer_colnum
            # получаем значение производителя в прайсе
            #debugger
            manufacturer_orig = row[manufacturer_colnum].to_s.mb_chars.strip.upcase.to_s
            # если встретили этот синоним в прайсе впервые
            unless manufacturer = used_in_this_price[manufacturer_orig]
              # если не нашли в глобальной таблице соответствия синонимов и производителей
              unless manufacturer = manufacturer_synonyms_hs[manufacturer_orig]
                # то создаем синоним и такого же производителя
                ManufacturerSynonym.create(:title => manufacturer_orig, :manufacturer => Manufacturer.create(:title => manufacturer_orig))

                manufacturer = manufacturer_orig
                manufacturer_synonyms_hs[manufacturer_orig] = manufacturer
              end
              # обновляем, что синоним встречался в прайсе ранее из найденного в глобальной таблице, или нового созданного
              used_in_this_price[manufacturer_orig] = manufacturer
            end
          end
          
          query = query + manufacturer = manufacturer_colnum ? Price.connection.quote(manufacturer) + ", " : ""
          query = query + manufacturer_orig = manufacturer_colnum ? Price.connection.quote(manufacturer_orig) + ", " : ""
          query = query + applicability = applicability_colnum ? Price.connection.quote(row[applicability_colnum].to_s.strip) + ", " : ""
          query = query + multiply_factor = multiply_factor_colnum ? Price.connection.quote(row[multiply_factor_colnum].to_s.strip) + ", " : ""
          query = query + unit = unit_colnum ? Price.connection.quote(row[unit_colnum].to_s.strip) + ", " : ""
          query = query + country = country_colnum ? Price.connection.quote(row[country_colnum].to_s.strip) + ", " : ""
          query = query + external_id = external_id_colnum ? Price.connection.quote(row[external_id_colnum].to_s.strip) + ", " : ""
          query = query + parts_group = parts_group_colnum ? Price.connection.quote(row[parts_group_colnum].to_s.strip) + ", " : ""
          query = query + job_code
          query = query + price = Price.connection.quote(row[price_colnum].to_s.gsub(',','.').gsub(' ','')) + ", "
          query = query + catalog_number = Price.connection.quote(normalize_catalog_number(row[catalog_number_colnum])) + ", "
          query = query + supplier_id + ", "
          query = query + "'" + Digest::MD5.hexdigest(normalize_catalog_number(row[catalog_number_colnum]))[0..1] + "'"
          query = query + "),"

          i = i + 1
        end

        if i == 10
          query.chop!
          begin
            Price.connection.execute(query)
          rescue => e
            #puts query
            #debugger
            raise e
          end
          query = ""
          i = 0
        end

      end

      #TODO Объединить с верхним (это на случай если записей меньше n)
      if query.present?
        query.chop!
        Price.connection.execute(query)
      end
    end

    add_doublet_idx
    
  end

  def prepare_insertion_table
    Price.connection.execute("DROP TABLE IF EXISTS prices_#{@job.id}")
    Price.connection.execute("CREATE TABLE prices_#{@job.id} like prices")
  end

  def add_doublet_idx
    query = "ALTER TABLE prices_#{@job.id} ADD INDEX doublet_idx (doublet)"
    Price.connection.execute(query)
  end

  def perform
    #unless @jobable.importable.blank?
    #  importer_class = (@jobable.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
    #  importer = importer_class.new(@job, @jobable, @jobable.importable, @optional)
    #  self.optional = importer.import
    #end
      case @jobable.import_method.to_s

        when /_B_/

          # Удаляем либо по id задачи, либо по объединяющему коду
          if @jobable.job_code.present?
            CommonModule::all_prices_costs do |l|
              query = "DELETE FROM prices_costs_#{l} WHERE job_code = '#{@jobable.job_code}'"
              Price.connection.execute(query)
            end
          else
            CommonModule::all_prices_costs do |l|
              query = "DELETE FROM prices_costs_#{l} WHERE job_id = #{@job.id}"
              Price.connection.execute(query)
            end
          end
          
          # Вставляем все записи, которые имеются в прайсе в временную таблицу
          make_insertion

          # Переносим все записи в таблицу прайсов - цен
          move_to_prices_costs

        when /_I_/

          make_insertion
          move_to_prices_costs

        when /_U_/

          make_insertion
          # Обновляем цены в таблице прайсы - цены на тех записях, которые имеются в только что вставленной таблице
          # и обновляем статус у связанных записей, что они обработаны.
          update_prices_costs

          # Вставляем записи, которые не обработаны предыдущей процедурой
          move_to_prices_costs true

        when /_U0_/
          make_insertion
          update_prices_costs
      end

    super
  end
end
