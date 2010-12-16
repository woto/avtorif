class ImportJobable < AbstractJobber
  def perform
    #unless @jobable.importable.blank?
    #  importer_class = (@jobable.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
    #  importer = importer_class.new(@job, @jobable, @jobable.importable, @optional)
    #  self.optional = importer.import
    #end
    @optional.each do |opt|
      case @jobable.import_method.to_s
        when /_B_/
          Price.connection.execute("DELETE FROM prices WHERE job_id = #{@job.id}")
          i = 0
          query = ""
          job_id = title_colnum = title_boolean = count_colnum = count_boolean =  manufacturer_colnum = manufacturer_boolean = price_colnum = catalog_number_colnum = false

              job_id = Price.connection.quote(@job.id)

              if @jobable.title_colnum.present?
                title_colnum = @jobable.title_colnum - 1
                title_boolean = row[title_colnum].present?
              end

              if @jobable.count_colnum.present?
                count_colnum = @jobable.count_colnum - 1
                count_boolean =  row[count_colnum].present? 
              end

              if @jobable.manufacturer_colnum.present?              
                manufacturer_colnum = @jobable.manufacturer_colnum - 1
                manufacturer_boolean =  row[manufacturer_colnum].present? 
              end

              price_colnum = @jobable.income_price_colnum - 1
              catalog_number_colnum = @jobable.catalog_number_colnum - 1

          FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
            if i == 0
              query = "INSERT INTO prices (job_id, title, count, price_cost, manufacturer, catalog_number) VALUES "
            end

            if i < 1000
              title = title_boolean ? Price.connection.quote(row[title_colnum].to_s.strip) : "''"
              count = count_boolean ? Price.connection.quote(row[count_colnum].to_s.strip) : "''"
              manufacturer = manufacturer_boolean ? Price.connection.quote(row[manufacturer_colnum].to_s.strip) : "''"
              price = Price.connection.quote(row[price_colnum].to_s.strip.gsub(',','.'))
              catalog_number = Price.connection.quote(row[catalog_number_colnum].to_s.strip)

              query = query + "(#{job_id}, #{title}, #{count}, #{price}, #{manufacturer}, #{catalog_number}), "
              i = i + 1
            else
              query = query[0...-2]
              begin
                Price.connection.execute(query)
              rescue => e
                puts query
                debugger
                raise e
              end
              query = ""
              i = 0
            end


          end
        when /_I_/
          raise 'unknown import method'
          FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
            if(@jobable.manufacturer_colnum)
              #TODO сделать какую-то реализацию нормализации производителей
            end
            p = Price.new()
            p.job_id = @job.id
            #p.job_title = @job.title
            p.goods_id = -1
            p.supplier_id = @job.supplier_id
            p.supplier = @job.supplier
            p.title = row[@jobable.title_colnum - 1].strip if @jobable.title_colnum.present? && row[@jobable.title_colnum - 1].present?
            p.count = row[@jobable.count_colnum - 1].strip if @jobable.count_colnum.present? && row[@jobable.count_colnum - 1].present?
            p.price_cost = row[@jobable.income_price_colnum - 1].to_s.strip.gsub(',','.')
            p.manufacturer = row[@jobable.manufacturer_colnum - 1].strip if @jobable.manufacturer_colnum.present? && row[@jobable.manufacturer_colnum - 1].present?
            p.catalog_number = row[@jobable.catalog_number_colnum - 1].strip if row[@jobable.catalog_number_colnum - 1].present?
            #p.inn = @job.supplier.inn
            #p.kpp = @job.supplier.kpp
            #p.estimate_days = @jobable.estimate_days
            p.save
          end
        when /_U_/

        when /_U0_/
          
      end

    end
    super
  end
end
