require File.dirname(__FILE__) + '/../config/environment'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

class JobWalker

  JOB_TYPES = %w{
    receive_price
    import_price
    update_price_status
    send_notify
  }

  def call
    logger = RAILS_DEFAULT_LOGGER
    jobs = Job.all
    #logger.error jobs.collect{|job| job.title}

    # Обновляем инфу о следующем запуске
    jobs.each do |job|
      update_next_start(job)
      job.save
    end
  end

  def update_next_start(job)
    job.repeats.each do |repeat|
      r = Rufus::CronLine.new(repeat.cron_string)
      if r.next_time(Time.now) < job.next_start.time || job.next_start.time < Time.now
        job.next_start = r.next_time(Time.now).to_s(:db)
      end
    end
  end

end