# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

require 'delayed_job'
require 'delayed/tasks'

require 'yaml_db'
#require 'ar_fixtures'

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

    puts 'Очищаем emails и attachments'
    sh "rm -rf #{Rails.root}/public/system/emails/*"
    sh "rm -rf #{Rails.root}/public/system/attachments/*"
    sh "rm -rf #{Rails.root}/log/*"

    puts "Запускаем God"
    sh "sudo /etc/init.d/god start"
  end

  namespace :karta do
    task :mmc => :environment do
      sh 'xls2csv ./public/karta/MMC\ ТО\ Рольф\ 091211/MMC\ ТО\ Рольф\ 091211.xls > ./public/karta/MMC\ ТО\ Рольф\ 091211/MMC\ ТО\ Рольф\ 091211.csv'
      FasterCSV.foreach("./public/karta/MMC\ ТО\ Рольф\ 091211/MMC\ ТО\ Рольф\ 091211.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
        begin

          begin
            thousand_kilometers = (row[4].match(/ТО-(.*)/)[1].sub(" ","")).to_i/1000
          rescue => e
            next
          end

          #puts row
          tmp = Auto.find_by_title(row[0] + " " + row[1])
          unless tmp.blank?
            auto = tmp
          else
            auto = Auto.create(:title => row[0] + " " + row[1])
          end

          tmp = Period.find_by_thousand_kilometers(thousand_kilometers)
          unless tmp.blank?
            period = tmp
          else
            period = Period.create(:thousand_kilometers => thousand_kilometers)
          end

          tmp = AutoOption.find(:first, ['auto = ? AND period = ?', auto, period])
          unless tmp.blank?
            auto_option = tmp
          else
            auto_option = AutoOption.create(:auto => auto, :period => period)
          end

        rescue Exception => e
          puts e.backtrace 
        end
        
       end

        # Механическая коробка передач
        #".*?",".*?[^"]MT

        # Автоматическая коробка передач
        #".*?",".*?[^"]AT
    end
  end
end
