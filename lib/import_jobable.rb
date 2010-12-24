class ImportJobable < AbstractJobber
  def perform
    #unless @jobable.importable.blank?
    #  importer_class = (@jobable.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
    #  importer = importer_class.new(@job, @jobable, @jobable.importable, @optional)
    #  self.optional = importer.import
    #end
      case @jobable.import_method.to_s
        when /_B_/

          job_id = Price.connection.quote(@job.id)
          Price.connection.execute("DROP TABLE IF EXISTS prices_#{job_id}")
          Price.connection.execute("CREATE TABLE prices_#{job_id} like prices")

          @optional.each do |opt|
            #debugger
            i = 0
            query = ""
            unit_colnum, multiply_factor_colnum, external_id_colnum = country_colnum = applicability_colnum =  min_order_colnum = description_colnum = unit_package_colnum = title_en_colnum = title_colnum = count_colnum = manufacturer_colnum = price_colnum = catalog_number_colnum = false

            #Price.connection.execute("DELETE FROM prices WHERE job_id = #{job_id}")

            query_template = "INSERT INTO prices_#{job_id} (job_id, title, count, price_cost, manufacturer, catalog_number, title_en, unit_package, description, min_order, applicability, country, external_id, unit, multiply_factor) VALUES "

            if @jobable.title_colnum.present?
              title_colnum = @jobable.title_colnum - 1
            end

            if @jobable.title_en_colnum.present?
              title_en_colnum = @jobable.title_en_colnum - 1
            end

            if @jobable.unit_package_colnum.present?
              unit_package_colnum = @jobable.unit_package_colnum - 1
            end

            if @jobable.description_colnum.present?
              description_colnum = @jobable.description_colnum - 1
            end

            if @jobable.min_order_colnum.present?
              min_order_colnum = @jobable.min_order_colnum - 1
            end

            if @jobable.count_colnum.present?
              count_colnum = @jobable.count_colnum - 1
            end

            if @jobable.manufacturer_colnum.present?              
              manufacturer_colnum = @jobable.manufacturer_colnum - 1
            end

            if @jobable.applicability_colnum.present?              
              applicability_colnum = @jobable.applicability_colnum - 1
            end

            if @jobable.multiply_factor_colnum.present?
              multiply_factor_colnum = @jobable.multiply_factor_colnum - 1
            end

            if @jobable.unit_colnum.present?              
              unit_colnum = @jobable.unit_colnum - 1
            end

            if @jobable.country_colnum.present?              
              country_colnum = @jobable.country_colnum - 1
            end

            if @jobable.external_id_colnum.present?              
              external_id_colnum = @jobable.external_id_colnum - 1
            end

            price_colnum = @jobable.income_price_colnum - 1
            catalog_number_colnum = @jobable.catalog_number_colnum - 1

            FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
              if i == 0
                query = query_template
              end
              
              if i < 100
                
                applicability = applicability_colnum ? Price.connection.quote(row[applicability_colnum].to_s.strip) : "''"
                external_id = external_id_colnum ? Price.connection.quote(row[external_id_colnum].to_s.strip) : "''"
                title = title_colnum ? Price.connection.quote(row[title_colnum].to_s.strip) : "''"
                title_en = title_en_colnum ? Price.connection.quote(row[title_en_colnum].to_s.strip) : "''"
                unit_package = unit_package_colnum ? Price.connection.quote(row[unit_package_colnum].to_s.strip) : "''"
                unit = unit_colnum ? Price.connection.quote(row[unit_colnum].to_s.strip) : "''"
                multiply_factor = multiply_factor_colnum ? Price.connection.quote(row[multiply_factor_colnum].to_s.strip) : "''"
                description = description_colnum ? Price.connection.quote(row[description_colnum].to_s.strip) : "''"
                country = country_colnum ? Price.connection.quote(row[country_colnum].to_s.strip) : "''"
                min_order = min_order_colnum ? Price.connection.quote(row[min_order_colnum].to_s.strip) : "''"
                count = count_colnum ? Price.connection.quote(row[count_colnum].to_s.strip) : "''"
                manufacturer = manufacturer_colnum ? Price.connection.quote(row[manufacturer_colnum].to_s.strip) : "''"
                price = Price.connection.quote(row[price_colnum].to_s.gsub(',','.').gsub(' ',''))
                catalog_number = Price.connection.quote(row[catalog_number_colnum].to_s.strip)

                query = query + "(#{job_id}, #{title}, #{count}, #{price}, #{manufacturer}, #{catalog_number}, #{title_en}, #{unit_package}, #{description}, #{min_order}, #{applicability}, #{country}, #{external_id}, #{unit}, #{multiply_factor}),"
                i = i + 1
              end

              if i == 100
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

          query = "INSERT INTO prices (title, count, price_cost, manufacturer, catalog_number, title_en, unit_package, description, min_order, applicability, country, external_id, unit, multiply_factor) SELECT title, count, price_cost, manufacturer, catalog_number, title_en, unit_package, description, min_order, applicability, country, external_id, unit, multiply_factor FROM prices_#{job_id}"
          Price.connection.execute(query)

        when /_I_/
        when /_U_/
        when /_U0_/
          
      end

    super
  end
end
