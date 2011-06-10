# TODO Надо проверять замену (конкретный пример, когда HAB-110 является заменой HAB-110)
require 'fcntl'

namespace :avtorif do

  desc "Если вес present?, то обновляем, вставляем, аналогично с заменами и новым кат. номером"
  task "replaces" => :environment do
    job_id = ENV["ID"]
    as_hash = {:as => :hash}
    client = ActiveRecord::Base.connection.instance_variable_get :@connection

    CommonModule::all_doublets do |d|
      puts d
      # Получаем записи из таблицы импорта по обрабатываемому дуплету
      begin
        price_import_result = client.query("SELECT * from price_import_#{job_id} WHERE doublet = '#{d}' AND processed = 0 LIMIT 100", as_hash)

        price_import_result.each do |price_import_row|

    #debugger
          # Запоминаем производителя
          if price_import_row['manufacturer'].present?
            price_import_manufacturer = ActiveRecord::Base.connection.quote(price_import_row['manufacturer'])
            price_import_manufacturer_condition = " = "
          else
            price_import_manufacturer = 'NULL'
            price_import_manufacturer_condition = " IS "
          end

          # Запомниаем заменяемого произв.
          if price_import_row["replacement_manufacturer"].present?
            price_import_replacement_manufacturer = ActiveRecord::Base.connection.quote(price_import_row["replacement_manufacturer"])
          else
            price_import_replacement_manufacturer = 'NULL'
          end

          # Ищем в таблице каталога по кат. номеру и производителю
          query = "SELECT * FROM price_catalog_#{d} WHERE catalog_number = '#{price_import_row['catalog_number']}' AND manufacturer #{price_import_manufacturer_condition} #{price_import_manufacturer}"
          price_catalog_result = client.query(query, as_hash) 

          if (price_catalog_row = price_catalog_result.first).present?
            price_catalog_id = price_catalog_row['id']

            # Обновляем название детали
            #if price_import_row['catalog_number'] == '104000'
            #  debugger
            #end
            if price_import_row['title'].present?
              if price_import_row['title'] != price_catalog_row['title']
                query = "UPDATE price_catalog_#{d} SET title = #{ActiveRecord::Base.connection.quote(price_import_row['title'])} WHERE id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
              end
            end

            # Обновляем англ. название детали
            if price_import_row['title_en'].present?
              if price_import_row['title_en'] != price_catalog_row['title_en']
                query = "UPDATE price_catalog_#{d} SET title_en = #{ActiveRecord::Base.connection.quote(price_import_row['title_en'])} WHERE id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
              end
            end

            # Обновляем вес
            if price_import_row['weight_grams'].present? && price_import_row['weight_grams'] > 0
              if price_import_row['weight_grams'] != price_catalog_row['weight_grams']
                query = "UPDATE price_catalog_#{d} SET weight_grams = #{price_import_row['weight_grams']} WHERE id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
              end
            end

            # Обновляем ссылку на изображение
            if price_import_row['image_url'].present?
              if price_import_row['image_url'] != price_catalog_row['image_url']
                query = "UPDATE price_catalog_#{d} SET image_url = #{ActiveRecord::Base.connection.quote(price_import_row['image_url'])} WHERE id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
              end
            end

            # Обновляем замены
            found = false
            column = 0

            if(price_import_row['replacement'].present? &&
              !(price_catalog_row['catalog_number'] == price_import_row['replacement'] &&
                price_catalog_row['manufacturer'] == price_import_row['replacement_manufacturer']))

              for column in 0...AppConfig.max_replaces
                if (price_catalog_row["r#{column}"].nil?)
                  # Если отсутствует или не нашли в процессе обхода всех столбцов каталога
                  found = false
                  break
                end

                if((price_catalog_row["r#{column}"] == price_import_row["replacement"]) &&
                   (price_catalog_row["rm#{column}"] == price_import_row["replacement_manufacturer"]))
                  found = true
                  break
                end
              end

              unless found
                query = "UPDATE price_catalog_#{d} SET r#{column} = '#{price_import_row['replacement']}', rm#{column} = #{price_import_replacement_manufacturer} where id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
              end
            end

          else
            query = "INSERT INTO price_catalog_#{d} (catalog_number, manufacturer) VALUES ('#{price_import_row['catalog_number']}', #{price_import_manufacturer})"
            Price.connection.execute(query)
            # Сделали начальную вставку, а дальше обновлением пройдет (Потом нужно оптимизировать и сразу вставлять подходящие поля)
            retry
          end
        end

        if price_import_result.any?
          query = "UPDATE price_import_#{job_id} SET processed = 1 WHERE id IN(#{price_import_result.map{|pir| pir['id']}.join(', ')})"
          Price.connection.execute(query)
        end

      end while price_import_result.any?
    end

  end

  desc "Очистка"
  task :reclean do
    puts 'Рестартуем Cron'
    sh 'sudo /etc/init.d/cron restart'

    puts 'Останавливаем God'
    begin
      sh "sudo /usr/bin/god terminate"
    rescue StandardError => e
    end

    puts 'Запускаем миграции с нуля'
    Rake::Task['db:migrate:reset'].invoke

    puts 'Загружаем fixtures'
    Rake::Task['db:fixtures:load'].invoke
    
    puts 'Создаем на основе шаблона хранилища'
    Rake::Task['avtorif:create_price_store'].invoke

    puts 'Очищаем emails и supplier_prices'
    sh "rm -rf #{Rails.root}/public/system/emails/*"
    sh "rm -rf #{Rails.root}/public/system/supplier_prices/*"
    sh "rm -rf #{Rails.root}/public/system/attachments/*"
    sh "rm -rf #{Rails.root}/system/prices_archive/*"
    sh "rm -rf #{Rails.root}/system/emex/*"
    sh "rm -rf #{Rails.root}/log/*"

    puts "Запускаем God"
    sh "sudo /etc/init.d/god start"
  end 
  
  desc "Создать хранилища на основе шаблонов"
  task :create_price_store => :environment do
    result = []
    sql = "SHOW CREATE TABLE price_cost_templates"
    result[0] = ActiveRecord::Base.connection.execute(sql)
    sql = "SHOW CREATE TABLE price_catalog_templates"
    result[1] = ActiveRecord::Base.connection.execute(sql)
    CommonModule::all_doublets do |l|
      begin
        ActiveRecord::Base.connection.execute(result[0].first[1].gsub(/`price_cost_templates`/, "`price_cost_#{l}`"))
      rescue => e
        puts e
      end

      begin
        ActiveRecord::Base.connection.execute(result[1].first[1].gsub(/`price_catalog_templates`/, "`price_catalog_#{l}`"))
      rescue => e
        puts e
      end
    end
  end
  
  desc "Удалить хранилища созданные на основе шаблона"
  task :drop_price_store => :environment do
    CommonModule::all_doublets do |l|
      begin
        sql = "DROP TABLE price_cost_#{l}"
        ActiveRecord::Base.connection.execute(sql)
      rescue => e
        puts e
      end

      begin
        sql = "DROP TABLE price_catalog_#{l}"
        ActiveRecord::Base.connection.execute(sql)
      rescue => e
        puts e
      end
    end
  end

  desc "Удалить старые прайсы (файлы). В соответствии с group_code"
  task :destroy_old_supplier_prices => :environment do
    Rake::Task['avtorif:prices_archive'].invoke

    Supplier.all.each do |supplier|
      supplier.jobs.all.each do |job|       
        begin
          group_code = SupplierPrice.where("job_id = #{job.id}").order("id desc").limit(1).first.group_code
        rescue => e
          next
        end
        job.supplier_prices.all.each do |supplier_price|
          if supplier_price.group_code != group_code
            begin
              supplier_price.destroy
            rescue => e
              #SupplierPrice.delete(supplier_price.id)
              puts e
            end
          end
        end
      end
    end
  end

  desc 'Выгрузить прайсы (файлы) в samba'
  task :prices_archive => :environment do

    def safe_name(file_name)
      file_name.gsub(Regexp.new('[\/:*?"<>|]'), "-")
    end

    def recursive_job(job, path = "")
      begin
        group_code =  SupplierPrice.where("job_id = #{job.id}").order("id desc").limit(1).first.group_code
      rescue => e
        return
      end

      chained_path = path + "/" + safe_name(job.title) + "_" + job.jobable_type

      cur_path = Rails.root.to_s + "/system/prices_archive/" + safe_name(job.supplier.title) + "/" + chained_path

      begin
        FileUtils.mkdir_p(cur_path)
      rescue => e
        puts e
      end

      job.supplier_prices.where(:group_code => group_code).all.each do |supplier_price|
        begin
          file_name = safe_name(supplier_price.attachment.original_filename)
          File.syscopy(supplier_price.attachment.path, cur_path + "/" + file_name)
        rescue => e
          puts e
        end
      end
      
      if(job.childs.size > 0)
        job.childs.each do |child|
          recursive_job(child, chained_path)
        end
      end
    end

    Supplier.all.each do |supplier|
      supplier.jobs.where(:jobable_type => "ReceiveJob").all.each do |job|
        recursive_job(job)
        #job.supplier_prices.all.each do |supplier_price|
      end
    end

  end
end
