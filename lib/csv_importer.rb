class CsvImporter < AbstractImporter

  def import
    attachments = Attachment.all(:conditions => ['proceded = false AND supplier_id = ?', @importer.import_job.job.supplier.id])
    #@importer.import_job.job.supplier
    #file
    attachments.each do |attachment|

      counter = 1
      FasterCSV.foreach(attachment.attachment.path, :col_sep =>';', :row_sep => '\r\n') do |columns|
        next if columns.empty?
        next if counter < @importer.start_from_line
        counter += 1

          manufacturer = Manufacturer.find_or_create_by_title(columns[@importer.import_job.manufacturer_colnum - 1])
          goods = Goods.all(:conditions => ['catalog_number = ? and manufacturer_id = ?', columns[@importer.import_job.catalog_number_colnum - 1], manufacturer])
          if goods.empty?
            goods = Goods.create(:title => columns[@importer.import_job.title_colnum - 1],
                         :catalog_number => columns[@importer.import_job.catalog_number_colnum - 1],
                         :manufacturer => manufacturer
                         )
            # TODO сделать
            # оригинал



            cost = columns[@importer.import_job.cost_colnum - 1]
            cost = cost.gsub(',', '.')
            cost = cost.to_d
            cost = cost * @importer.import_job.margin

            Price.create(
              :goods => goods,
              :supplier => @importer.import_job.job.supplier,
              :title => columns[@importer.import_job.title_colnum - 1],
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
      end
    end
  end
#end