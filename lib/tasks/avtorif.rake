require 'fcntl'

namespace :avtorif do

  desc "Если вес present?, то обновляем, вставляем, аналогично с заменами и новым кат. номером"
  task "replacements" => :environment do

    def replacements_check price_import_row
      for i in 0...AppConfig.max_replaces
        if([1,3].include?(price_import_row["rdi" + i.to_s]))
          # Прямая замена или двунаправленная
          return true
        end
      end
    end

    def prompt
      STDOUT.write ">> "
      STDIN.gets
    end

    job_id = ENV["ID"]
    as_hash = {:as => :hash}
    client = ActiveRecord::Base.connection.instance_variable_get :@connection

    CommonModule::all_doublets do |d|
      # Получаем записи из таблицы импорта по обрабатываемому дуплету
      price_import_result = client.query("SELECT * from price_import_#{job_id} WHERE doublet = '#{d}'", as_hash)

      price_import_result.each do |price_import_row|

        # Используется для выброса изнутри вложенных циклов
        goto_next_import_row = false
        
        # Запоминаем обрабтываемый каталожный номер
        price_import_catalog_number = price_import_row['catalog_number']

        # Запоминаем производителя
        if price_import_row['manufacturer'].present?
          price_import_manufacturer = " '#{price_import_row['manufacturer']}'"
          price_import_manufacturer_condition = " = "
        else
          price_import_manufacturer = 'NULL'
          price_import_manufacturer_condition = " IS "
        end


        puts "Обрабатывается: каталожный номер: '#{price_import_row['catalog_number']}', производитель: '#{price_import_row['manufacturer']}', id #{price_import_row['id']}"
        puts "\r\n"

        # Надо получать?
        if(price_import_row['weight_grams'] || price_import_row['new_catalog_number'] || replacements_check(price_import_row))

          # Ищем в таблице каталога по кат. номеру и производителю
          query = "SELECT * FROM price_catalog_#{d} WHERE catalog_number = '#{price_import_catalog_number}' AND manufacturer #{price_import_manufacturer_condition} #{price_import_manufacturer}"
          price_catalog_result = client.query(query, as_hash) 

          if (price_catalog_row = price_catalog_result.first).present?
            price_catalog_id = price_catalog_row['id']
            puts "В каталоге найден: каталожный номер: '#{price_catalog_row['catalog_number']}', производитель: '#{price_catalog_row['manufacturer']}', id: #{price_catalog_id}"
            puts "\r\n"

            # TODO спросить обновить ли вес?

            if price_import_row['weight_grams'].present? && price_import_row['weight_grams'] > 0
              puts "Старый вес: '#{price_catalog_row['weight_grams']}', новый вес: '#{price_import_row['weight_grams']}', обновить?"
              if prompt == 'y'
                query = "UPDATE price_catalog_#{d} SET weight_grams = '#{price_import_weight_grams}' WHERE id = #{price_catalog_id}"
                ActiveRecord::Base.connection.execute(query)
                puts "Вес обновили"
              else
                puts "Вес не обновили"
              end
            end

            # TODO новый каталожный номер

            # Если хотя бы в одном из столбцов импортируемого прайса есть замена прямая или двунаправленная
            if replacements_check price_import_row
              for j in 0...AppConfig.max_replaces
                # Проходимся по все прямым или двунаправленным заменам
                if [1,3].include?(price_import_row["rdi#{j}"])
                  found = false
                  for k in 0...AppConfig.max_replaces
                    # Если в каталоге закончились заполненные столбцы
                    if (price_catalog_row["r#{k}"].nil?)
                      found = false
                      break
                    end

                    # Не нашли в прайс-каталоге такой замены, ставим флагу found = false, включаемся в работу. В k будет последний проверенный столбец замен каталога
                    if(price_import_row["r#{j}"].nil? || ((price_catalog_row["r#{k}"] == price_import_row["r#{j}"]) && (price_catalog_row["rm#{k}"] == price_import_row["rm#{j}"])))
                      found = true
                      break
                    end
                  end

                  unless found

                    puts "Имеющиеся замены: "
                    for i in 0...AppConfig.max_replaces
                      puts "каталожный номер: '" + price_catalog_row["r#{i}"] + "', производитель: '" + price_catalog_row["rm#{i}"].to_s + "'\r\n" if price_catalog_row["r#{i}"].present?
                    end
                    puts "\r\n"

                    puts "Новые замены: "
                    for i in 0...AppConfig.max_replaces
                      # Если замена прямая или двусторонняя
                      if([1,3].include? (price_import_row["rdi#{i}"]))
                        puts "кататложный номер: '" + price_import_row["r#{i}"] + ", производитель: '" + price_import_row["rm#{i}"].to_s + "'\r\n" if price_import_row["r#{i}"].present?
                      end  
                    end
                    puts "\r\n"

                    puts "Найдена новая замена: '" + price_import_row["r#{j}"].to_s + "', производитель: '" + price_import_row["rm#{j}"].to_s + "'. Что делать?
                    ia - пропустить полностью текущую деталь
                    ua - полностью обновить недостающие замены
                    ra - полностью заменить новыми заменами
                    i - пропустить текущую замену
                    u - обновить текущую замену"


                    case prompt.strip
                      when 'u'
                        if price_import_row["rm#{j}"].present?
                          price_replacement_manufacturer = "'" + price_import_row["rm#{j}"] + "'"
                        else
                          price_replacement_manufacturer = 'NULL'
                        end

                        query = "UPDATE price_catalog_#{d} SET r#{k} = '" + price_import_row["r#{j}"] + "', rm#{k} = #{price_replacement_manufacturer} where id = #{price_catalog_id}"
                        ActiveRecord::Base.connection.execute(query)
                      when 'r'
                      when 'ra'
                        query = "UPDATE price_catalog_#{d} SET "

                        counter = 0
                        for i in 0...AppConfig.max_replaces
                          if([1,3].include?(price_import_row["rdi#{i}"]))
                            counter = counter + 1

                            if(price_import_row["rm#{i}"].present?)
                              price_replacement_manufacturer = "'" + price_import_row["rm#{i}"] + "'"
                            else
                              price_replacement_manufacturer = 'NULL'
                            end

                            query = query + "r#{i} = '" + price_import_row["r#{i}"] + "', rm#{i} = " + price_replacement_manufacturer + ", "
                          end

                        end

                        for i in counter...AppConfig.max_replaces - counter
                          # Очищаем оставшиеся поля
                          query = query + "r#{i} = NULL, rm#{i} = NULL, "
                        end

                        query = query[0, query.size - 2]
                        ActiveRecord::Base.connection.execute(query)
                        goto_next_import_row = true
                        break

                      when 'i'
                        
                      when 'ia'
                        zzz
                    end


                  end
                end

                # Если надо перейти к следующей записи импорта
                if goto_next_import_row
                  break
                end
              end
            end
          else
            puts "Вставили один в один"
            #query = "INSERT INTO price_catalog_#{d} SET catalog_number = '#{price_import_catalog_number}', manufacturer = #{price_import_manufacturer}, weight_grams = '#{price_import_weight_grams}'"
          end
        end
      end
    end
  end

=begin
                if price_catalog_row.present?
                  # Если нашли в каталоге
                  last_column_in_catalog = 0
                  for price_catalog_column in 0..AppConfig.max_replaces-1 do
                    if(price_catalog_row["r#{price_catalog_column}"].present?)
                      # Если у записи в каталоге есть такая замена
                      if (price_catalog_row["r#{price_catalog_column}"] == price_import_row["r#{price_import_column}"] && price_catalog_row["rm#{price_catalog_column}"] == price_import_row["rm#{price_import_column}"])
                        # Если совпадает и кат. номер замены и производитель замены
                        found = true
                        break
                      end
                    end

                    last_column_in_catalog = last_column_in_catalog + 1

                    # Если не нашли в списке замен
                    unless found
                      query = "UPDATE price_catalog_#{d} SET r#{last_column_in_catalog} = '" + price_import_row["r#{price_import_column}"] + "', rm#{last_column_in_catalog} = " + ((price_import_row["rm#{price_import_column}"].nil?) ? ("NULL") :  ("'" + price_import_row["rm#{price_import_column}"] + "'")) + " WHERE id = #{price_catalog_id}"
                      ActiveRecord::Base.connection.execute(query)
                      goto_next_column = true
                      break
                    end
                  end
                  break if goto_next_column
                else
                  # Если не нашли в каталоге, то вставляем
                  begin
                    query = "INSERT INTO price_catalog_#{d} SET catalog_number = '#{price_import_catalog_number}', manufacturer = #{price_import_manufacturer}, r0 = '#{price_import_row['r0']}', rm0 = " + ((price_import_row["rm#{price_import_column}"].nil?) ? ("NULL") : ("'" + price_import_row["rm#{price_import_column}"] + "'")) # TODO! тут достроить
                    ActiveRecord::Base.connection.execute(query)
                  rescue => e
                    debugger
                    puts '1'
                  end
                end

=end

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

    puts 'Очищаем emails и supplier_prices'
    sh "rm -rf #{Rails.root}/public/system/emails/*"
    sh "rm -rf #{Rails.root}/public/system/supplier_prices/*"
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
