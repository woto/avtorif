require File.dirname(__FILE__) + '/../config/environment'
require File.dirname(__FILE__) + '/../config/boot'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

#require 'receive_jobber'

#logger = RAILS_DEFAULT_LOGGER
#logger.level = Logger::ERROR


class JobWalker

  def call
    jobs = Job.all(:conditions => {:active => true})
    #logger.error jobs.collect{|job| job.title}

    jobs.each do |job|
      if job.parent.blank? && (job.next_start.nil? || job.next_start < Time.zone.now) && !job.repeats.blank? && !job.locked
        # Запускаем задачи, у которых время следующего запуска меньше текущего
        start_job(job)
      end
    end
  end

  def start_job(job, optional = nil)
      #raise StandardError
      #puts job

      begin

      nearest_next_time = nil
      min = nil

      job.repeats.each do |repeat|
        r = Rufus::CronLine.new(repeat.cron_string)
        nearest_next_time = r.next_time(Time.zone.now)
        if min.blank? or nearest_next_time < min
          min = nearest_next_time
        end
      end
      job.next_start = min

      job.last_start = Time.zone.now
      job.locked = true
      
      jobber_class = (job.jobable.class.to_s.split(/(.*?)Job/)[1] + "Jobable").classify.constantize

      #jobber = jobber_class.new(concrete_job)
      #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)

      #Delayed::Job.enqueue jobber_class.new(job, job.jobable, optional)
      jobber_class.new(job, job.jobable, optional).perform

      job.save
      rescue => e
        return
      end
  end
end