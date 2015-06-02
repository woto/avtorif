class ImportJobable < AbstractJobber


  def update_prices_costs
    CommonModule::all_doublets do |l|
      query = "
        UPDATE price_import_#{@job_id} pi
          JOIN price_cost_#{l} pc 
            ON pc.price_setting_id = #{@price_setting_id}
              AND pi.catalog_number = pc.catalog_number 
              AND ( (pi.manufacturer_orig = pc.manufacturer_orig)
                OR ( pi.manufacturer_orig IS NULL 
                  AND pc.manufacturer_orig IS NULL ) )
          SET 
            pi.processed = 1, 
            pc.price_cost = pi.price_cost,
            pc.minimal_income_cost = pi.minimal_income_cost,
            pc.count = pi.count,
            pc.title = pi.title,
            pc.title_en = pi.title_en,
            pc.manufacturer = pi.manufacturer,
            pc.manufacturer_orig = pi.manufacturer_orig,
            pc.catalog_number = pi.catalog_number,
            pc.catalog_number_orig = pi.catalog_number_orig,
            pc.country = pi.country,
            pc.supplier_id = pi.supplier_id,
            pc.weight_grams = pi.weight_grams,
            pc.external_id = pi.external_id,
            pc.external_supplier_id = pi.external_supplier_id,
            pc.parts_group = pi.parts_group,
            pc.delivery_days_declared = pi.delivery_days_declared,
            pc.image_url = pi.image_url,
            pc.unit_package = pi.unit_package,
            pc.multiply_factor = pi.multiply_factor,
            pc.min_order = pi.min_order,
            pc.description = pi.description,
            pc.unit = pi.unit,
            pc.applicability = pi.applicability,
            pc.job_id = #{@job_id}
        WHERE pi.doublet = '#{l}'"
      Price.connection.execute(query)
      # pc.success_percent = pi.success_percent,
    end
  end

  def delete_prices_costs
    CommonModule::all_doublets do |l|
      query = "
        DELETE pc.* FROM price_cost_#{l} pc
          JOIN price_import_#{@job_id} pi
            ON pc.price_setting_id = #{@price_setting_id}
              AND pi.catalog_number = pc.catalog_number 
              AND ( (pi.manufacturer_orig = pc.manufacturer_orig)
                OR ( pi.manufacturer_orig IS NULL 
                  AND pc.manufacturer_orig IS NULL ) )
        WHERE pi.doublet = '#{l}'"
      Price.connection.execute(query)

      query = "
        UPDATE price_import_#{@job_id} pi 
        SET pi.processed = 1
        WHERE pi.doublet = '#{l}'"
      Price.connection.execute(query)
    end
  end

  def move_to_prices_costs processed_condition = false
    additional = ""
    if processed_condition
      additional = " AND processed != 1"
    end

    CommonModule::all_doublets do |l|
      query = "INSERT INTO price_cost_#{l} (job_id, title, count, price_cost, minimal_income_cost, manufacturer, manufacturer_orig, catalog_number, catalog_number_orig, title_en, weight_grams, unit_package, description, min_order, applicability, country, external_id, external_supplier_id, parts_group, delivery_days_declared, image_url, unit, multiply_factor, price_setting_id, supplier_id) SELECT job_id, title, count, price_cost, minimal_income_cost, manufacturer, manufacturer_orig, catalog_number, catalog_number_orig, title_en, weight_grams, unit_package, description, min_order, applicability, country, external_id, external_supplier_id, parts_group, delivery_days_declared, image_url, unit, multiply_factor, price_setting_id, supplier_id FROM price_import_#{@job_id} WHERE doublet = '#{l}' #{additional}"
      Price.connection.execute(query)

      query = "UPDATE price_import_#{@job_id} SET processed = 1 WHERE doublet = '#{l}'"
      Price.connection.execute(query)
    end
  end

  def make_insertion
    CommonModule::prepare_insertion_table(@job_id)
    catalog_number_colnum = @jobable.catalog_number_colnum - 1

    @optional.each do |opt|
      query = ""
      manufacturer, manufacturer_orig, manufacturer_synonyms_hs, unit_colnum, multiply_factor_colnum, external_id_colnum, external_supplier_id, default_external_supplier_id, parts_group_colnum, delivery_days_declared_colnum, delivery_days_declared, image_url, country_colnum, applicability_colnum,  min_order_colnum, description_colnum, unit_package_colnum, title_en_colnum, weight_grams_colnum, title_colnum, count_colnum, manufacturer_colnum, minimal_income_cost = false

      query_template = "INSERT INTO price_import_#{@job_id} (job_id, "
      
      if @jobable.title_colnum.present?
        title_colnum = @jobable.title_colnum - 1
        query_template = query_template + "title, "
      end

      if @jobable.title_en_colnum.present?
        title_en_colnum = @jobable.title_en_colnum - 1
        query_template = query_template + "title_en, "
      end

      if @jobable.weight_grams_colnum.present?
        weight_grams_colnum = @jobable.weight_grams_colnum - 1
        query_template = query_template + "weight_grams, "
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
      elsif @jobable.default_manufacturer.present?
        query_template = query_template + "manufacturer, manufacturer_orig, "
        default_manufacturer = CommonModule::find_manufacturer_synonym(@jobable.default_manufacturer, @job_id) + ", "
        default_manufacturer_orig = CommonModule::manufacturer_orig(@jobable.default_manufacturer) + ", "
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

      if @jobable.external_supplier_id_colnum.present?              
        external_supplier_id_colnum = @jobable.external_supplier_id_colnum - 1
        query_template = query_template + "external_supplier_id, "
      elsif @jobable.default_external_supplier_id.present?
        query_template = query_template + "external_supplier_id, "
        default_external_supplier_id = Price.connection.quote(@jobable.default_external_supplier_id.to_s.strip) + ", "
      end

      if @jobable.parts_group_colnum.present?              
        parts_group_colnum = @jobable.parts_group_colnum - 1
        query_template = query_template + "parts_group, "
      end

      if @jobable.delivery_days_declared_colnum.present?
        delivery_days_declared_colnum = @jobable.delivery_days_declared_colnum.to_i - 1
        query_template = query_template + "delivery_days_declared, "
      end

      if @jobable.minimal_income_cost_colnum.present?              
        minimal_income_cost_colnum = @jobable.minimal_income_cost_colnum - 1
        query_template = query_template + "minimal_income_cost, "
      end

      if @jobable.image_url_colnum.present?              
        image_url_colnum = @jobable.image_url_colnum - 1
        query_template = query_template + "image_url, "
        image_url_prefix = @jobable.image_url_prefix
      end

      query_template = query_template + "price_cost, catalog_number, catalog_number_orig, supplier_id, price_setting_id) VALUES "

      #BUG Проверить, на работоспособность (Потребовалось после конвертирования из Excel в csv, где были переносы \r)
      FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
        begin
          query = query_template
         
          query = query + "(#{@job_id},"

          query = query + title = title_colnum ? Price.connection.quote(row[title_colnum].to_s.strip) + ", " : ""
          query = query + title_en = title_en_colnum ? Price.connection.quote(row[title_en_colnum].to_s.strip) + ", " : ""
          query = query + weight_grams = weight_grams_colnum ? Price.connection.quote(row[weight_grams_colnum].to_s.gsub(',','.').gsub(' ', '').to_f * @weight_coefficient) + ", " : ""
          query = query + unit_package = unit_package_colnum ? Price.connection.quote(row[unit_package_colnum].to_s.strip) + ", " : ""
          query = query + description = description_colnum ? Price.connection.quote(row[description_colnum].to_s.strip) + ", " : ""
          query = query + min_order = min_order_colnum ? Price.connection.quote(row[min_order_colnum].to_s.strip) + ", " : ""
          if count_colnum
            begin
              count = Price.connection.quote(Float(row[count_colnum].to_s.gsub(',', '.').gsub(' ', '').match(/([0-9]+([\.,][0-9])?)/)[0]).ceil)
              #count = Price.connection.quote(Integer(row[count_colnum].to_s.match('\d+')[0]))
              #count = Float(row[count_colnum].to_s.gsub(',','.').gsub(/[^0-9\.]/, '')).round 
            rescue
              count = "NULL"
            ensure
              query = query + count + ", "
            end
            #query = query + count = count_colnum ? Price.connection.quote(row[count_colnum].to_s.strip) + ", " : ""
          end

          if manufacturer_colnum
            query = query + manufacturer = CommonModule::find_manufacturer_synonym(row[manufacturer_colnum], @job_id) + ", "
            query = query + manufacturer_orig = CommonModule::manufacturer_orig(row[manufacturer_colnum]) + ", "
          elsif default_manufacturer
            query << default_manufacturer
            query << default_manufacturer_orig
          end
          
          query = query + applicability = applicability_colnum ? Price.connection.quote(row[applicability_colnum].to_s.strip) + ", " : ""
          query = query + multiply_factor = multiply_factor_colnum ? Price.connection.quote(row[multiply_factor_colnum].to_s.strip) + ", " : ""
          query = query + unit = unit_colnum ? Price.connection.quote(row[unit_colnum].to_s.strip) + ", " : ""
          query = query + country = country_colnum ? Price.connection.quote(row[country_colnum].to_s.strip) + ", " : ""
          query = query + external_id = external_id_colnum ? Price.connection.quote(row[external_id_colnum].to_s.strip) + ", " : ""
          
          if external_supplier_id_colnum
            query = query + external_supplier_id = Price.connection.quote(row[external_supplier_id_colnum].to_s.strip) + ", "
          elsif default_external_supplier_id
            query << default_external_supplier_id
          end

          query = query + parts_group = parts_group_colnum ? Price.connection.quote(row[parts_group_colnum].to_s.strip) + ", " : ""
          query = query + delivery_days_declared = delivery_days_declared_colnum ? Price.connection.quote(row[delivery_days_declared_colnum].to_s.split(/\D/).collect{|day| day.to_i}.last) + ", " : ""
          query = query + minimal_income_cost = minimal_income_cost_colnum ? Price.connection.quote(row[minimal_income_cost_colnum].to_s.mb_chars.gsub(',','.').gsub(/[  ]/,'')) + ", " : ""
          query = query + image_url = image_url_colnum ? Price.connection.quote((image_url_prefix ? image_url_prefix : "") + row[image_url_colnum].to_s.strip) + ", " : ""
          query = query + price = Price.connection.quote(row[@price_colnum].to_s.mb_chars.gsub(',','.').gsub(/[  ]/,'')) + ", "
          query = query + catalog_number = Price.connection.quote(CommonModule::normalize_catalog_number(row[catalog_number_colnum])) + ", "
          query = query + catalog_number_orig = Price.connection.quote(CommonModule::catalog_number_orig(row[catalog_number_colnum])) + ", "
          query = query + @supplier_id + ", "
          query = query + @price_setting_id

          query = query + ")"

          begin
            Price.connection.execute(query)
          rescue => e
            raise query + e
          end

        rescue CatalogNumberException
          next
        end
      end

    end
    CommonModule::add_doublet(@job_id)
  end

  def perform
    @weight_coefficient = @jobable.weight_coefficient
    @price_colnum = @jobable.income_price_colnum - 1
    @supplier_id = Price.connection.quote(@job.supplier_id)
    @job_id = @job.id
    @price_setting_id = Price.connection.quote(@jobable.price_setting.id)


      case @jobable.import_method.to_s

        when /_B_/

          CommonModule::all_doublets do |l|
            query = "DELETE FROM price_cost_#{l} WHERE price_setting_id = '#{@price_setting_id}'"
            Price.connection.execute(query)
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

        when /_D_/
          make_insertion
          delete_prices_costs

      end

    super
  end
end
