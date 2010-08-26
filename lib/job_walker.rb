require File.dirname(__FILE__) + '/../config/environment'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'
require 'config/boot'

#require 'receive_jobber'

class JobWalker

  def call
    #logger = RAILS_DEFAULT_LOGGER
    jobs = Job.all
    #logger.error jobs.collect{|job| job.title}

    jobs.each do |job|
      if job.parent.blank? && !job.next_start.nil? && job.next_start < Time.zone.now && !job.locked
        nearest_next_time = nil
        job.repeats.each do |repeat|
          r = Rufus::CronLine.new(repeat.cron_string)
          nearest_next_time = r.next_time(Time.zone.now)
          min = nearest_next_time if min.nil?
          if nearest_next_time < min
            min = nearest_next_time
          end
        end
        job.next_start = nearest_next_time
        # Запускаем задачи, у которых время следующего запуска меньше текущего
        start_job(job)
#          job.save
      end
    end
  end

  def start_job(job, optional = nil)
      #puts job
      job.last_start = Time.zone.now
      job.locked = true
      concrete_job = job.jobable
      jobber_class = (job.jobable_type.split(/(.*?)Job/)[1] + "Jobber").classify.constantize
      #jobber = jobber_class.new(concrete_job)
      #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)
      Delayed::Job.enqueue jobber_class.new(concrete_job, optional)
      job.save
  end
end