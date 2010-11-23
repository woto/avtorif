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
          FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
            if(@jobable.manufacturer_colnum)
              #TODO сделать какую-то реализацию нормализации производителей
            end
            p = Price.new()
            p.job_id = @job.id
            p.job_title = @job.title
            p.goods_id = -1
            p.supplier_id = @job.supplier_id
            p.supplier = @job.supplier
            p.title = row[@jobable.title_colnum - 1] unless @jobable.title_colnum.blank?
            p.count = row[@jobable.count_colnum - 1].gsub(',', '.').to_s.to_f
            p.initial_cost = row[@jobable.income_price_colnum - 1].to_s.gsub(',','.')
            p.result_cost = row[@jobable.income_price_colnum - 1].to_s.gsub(',', '.').to_f * @jobable.income_rate.to_s.gsub(',','.').to_f
            p.margin = @jobable.income_rate.to_s.gsub(',','.').to_f
            p.manufacturer = row[@jobable.manufacturer_colnum - 1] unless @jobable.manufacturer_colnum.blank?
            p.catalog_number = row[@jobable.catalog_number_colnum - 1]
            p.inn = @job.supplier.inn
            p.kpp = @job.supplier.kpp
            p.estimate_days = @jobable.estimate_days
            p.save
          end
        when /_I_/
          Вставка
        when /_U_/

        when /_U0_/
          
      end

    end
    super
  end
end
