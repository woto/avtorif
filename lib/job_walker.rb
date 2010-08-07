require File.dirname(__FILE__) + '/../config/environment'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

#require 'receive_jobber'

class JobWalker

  def call
    #logger = RAILS_DEFAULT_LOGGER
    jobs = Job.all
    #logger.error jobs.collect{|job| job.title}

    jobs.each do |job|
      job.repeats.each do |repeat|
        r = Rufus::CronLine.new(repeat.cron_string)
        # Обновляем время следующего запуска только у тех задач, у которых нет родителя
        if (job.next_start < Time.zone.now) && job.parent.blank?
          job.next_start = r.next_time(Time.zone.now)
          # Запускаем задачи, у которых время следующего запуска меньше текущего
          start_job(job)
#          job.save
        end
      end
      #job.save
    end
  end

  def start_job(job)
    puts job
    puts '123'
      job.last_start = Time.zone.now
      concrete_job = job.jobable
      jobber_class = (job.jobable_type.split(/(.*?)Job/)[1] + "Jobber").classify.constantize
      #jobber = jobber_class.new(concrete_job)
      #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)
      Delayed::Job.enqueue jobber_class.new(concrete_job)
    job.save
  end
end