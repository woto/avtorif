class CsvImporter < AbstractImporter

  def import

    attachments = Attachment.all(:conditions => ['proceded = false AND supplier_id = ?', @importer.import_job.job.supplier.id])
    #@importer.import_job.job.supplier
    #file
    attachments.each do |attachment|
      counter = 0
      # require 'csv'
      #begin
      #require 'csvscan'

      file = File.new(attachment.attachment.path, 'r')
      #CSVScan.scan(File.open(attachment.attachment.path, 'r')) do |columns|
      #Excelsior::Reader.rows(File.open(attachment.attachment.path, 'rb')) do |columns|
        #Ccsv.foreach(attachment.attachment.path) do |columns|
        #FasterCSV.foreach(attachment.attachment.path, :col_sep => @importer.delimeter.to_i) do |columns|
        #CSV.open(attachment.attachment.path, 'r', @importer.delimeter.to_i) do |columns|
        file.each_line("\n") do |row|
          unless row.empty?
            columns = row.split(@importer.delimeter.to_i.chr)
          else
            next
          end

          #if columns.size != 5
          #  i = 42
          #end
          
          counter += 1

          next if columns.empty?
          next if counter < @importer.start_from_line

            require 'iconv'
            iconv = Iconv.new("utf-8", "windows-1251")

            manufacturer = Manufacturer.find_or_create_by_title(iconv.iconv(columns[@importer.import_job.manufacturer_colnum - 1]))
            goods = Goods.all(:conditions => ['catalog_number = ? and manufacturer_id = ?', columns[@importer.import_job.catalog_number_colnum - 1], manufacturer])
            if goods.empty?


              goods = Goods.create(:title => iconv.iconv(columns[@importer.import_job.title_colnum - 1]),
                           :catalog_number => iconv.iconv(columns[@importer.import_job.catalog_number_colnum - 1]),
                           :manufacturer => manufacturer
                           )
              # TODO сделать
              # оригинал



              cost = iconv.iconv(columns[@importer.import_job.cost_colnum - 1])
              cost = cost.gsub(',', '.')
              cost = cost.to_f
              cost = cost * @importer.import_job.margin.to_f

              Price.create(
                :goods => goods,
                :supplier => @importer.import_job.job.supplier,
                :title => iconv.iconv(columns[@importer.import_job.title_colnum - 1]),
                :cost => cost
              )

              # TODO сделать
              # t.integer :replacement_colnum
              # t.integer :count_colnum


            else
              # raise Exception
            end

            # TODO настройки для csv файла: разделитель
            # с какой строки начать парсить
            #break if file.lineno > 10
        end
      #rescue Exception => e
      #  retry
      #end
    end
  end
end
#end