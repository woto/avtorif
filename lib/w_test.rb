  require 'rubygems'
  require 'rufus/scheduler'
  require 'time'
  require 'date'

  r = Rufus::CronLine.new('*/15 * * */2 *')
  p r.next_time(Time.local(2000,3,7,21,29,10))

  scheduler = Rufus::Scheduler.start_new

  scheduler.in '20m' do
    puts "order ristretto"
  end

  scheduler.at 'Thu Mar 26 07:31:43 +0900 2009' do
    puts 'order pizza'
  end

  scheduler.cron '*/1 14 * * *' do
    # every day of the week at 22:00 (10pm)
    puts '1'
  end

  scheduler.cron '15 * * * *' do
    # every day of the week at 22:00 (10pm)
    puts 'aaaactivat151515151515151515e security system'
  end

  scheduler.cron '36-36,38-40 * * * *' do
    # every day of the week at 22:00 (10pm)
    puts '36 38 39 40assaaactivate security system'
  end


  scheduler.cron '37 14 * * *' do
    # every day of the week at 22:00 (10pm)
    puts '14:37 assaaactivate security system'
  end


  scheduler.cron '59 14 28 7 *', :first_in => '1m' do
    # every day of the week at 22:00 (10pm)
    puts '14:37 assaaactivate security system'
  end


  scheduler.cron '38 14 29 7 *' do
    # every day of the week at 22:00 (10pm)
    puts '14:38 assaaactivate security system'
  end

  scheduler.every '5m' do
    puts 'check blood pressure'
  end

#p scheduler.all_jobs
#scheduler.join
