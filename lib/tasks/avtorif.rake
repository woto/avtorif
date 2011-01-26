namespace :avtorif do
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
    CommonModule::all_doublets do |l|
      begin
        sql = "CREATE TABLE price_cost_#{l} like prices"
        ActiveRecord::Base.connection.execute(sql)
      rescue => e
        puts e
      end

      begin
        sql = "CREATE TABLE price_catalog_#{l} like price_import_templates"
        ActiveRecord::Base.connection.execute(sql)
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
