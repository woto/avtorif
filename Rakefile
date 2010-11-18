# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Avtorif::Application.load_tasks

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
end
