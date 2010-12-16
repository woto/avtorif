namespace :avtorif do
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
  
  task :renice_dj => :environment do
    sql = "UPDATE delayed_jobs set run_at = 0, locked_at = NULL"
    ActiveRecord::Base.connection.execute(sql)
  end

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
              puts e
            end
          end
        end
      end
    end
  end
end
