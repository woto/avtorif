require File.dirname(__FILE__) + '/../config/environment'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

#require 'receive_jobber'

class JobWalker

  def call
    logger = RAILS_DEFAULT_LOGGER
    jobs = Job.all
    #logger.error jobs.collect{|job| job.title}

    jobs.each do |job|
      # Обновляем инфу о следующем запуске
      update_next_start(job)
      
      job.save
    end
  end

  def update_next_start(job)
    job.repeats.each do |repeat|
      r = Rufus::CronLine.new(repeat.cron_string)
      # Обновляем время следующего запуска только у тех задач, у которых нет родителя
      if (job.next_start < Time.zone.now) && job.parent.blank?
        job.next_start = r.next_time(Time.zone.now)
        # Запускаем задачи, у которых время следующего запуска меньше текущего
        start_job(job)
      end
    end
  end

  def start_job(job)
    # Если время запуска в прошлом, добавляем в очередь, обновляем время последнего запуска
    if(job.next_start?)
      job.last_start = Time.zone.now
      concrete_job = job.jobable_type.classify.constantize.find(job.jobable_id)
      jobber_class = (job.jobable_type.split(/(.*?)Job/)[1] + "Jobber").classify.constantize
      #jobber = jobber_class.new(concrete_job)
      #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)
      Delayed::Job.enqueue jobber_class.new(concrete_job)
    end
  end
end