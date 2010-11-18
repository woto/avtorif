require File.dirname(__FILE__) + '/../config/environment'
require File.dirname(__FILE__) + '/../config/boot'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

logger = Rails.logger
logger.level = Logger::ERROR


class JobWalker

  def call
    jobs = Job
    #logger.error jobs.collect{|job| job.title}

    jobs.active.each do |job|
      if job.parent.blank? && (job.next_start.nil? || job.next_start < Time.zone.now) && !job.repeats.blank? && !job.locked
        # Запускаем задачи, у которых время следующего запуска меньше текущего
        start_job(job)
      end
    end
  end

  def start_job(job, optional = nil)
      if optional.is_a?(Integer)
        supplier_price = SupplierPrice.find(optional)
        unless supplier_price.attachment.original_filename =~ Regexp.new(eval(job.file_mask))
          puts job.id  
          return
        end
      end
      
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
      job.started_once = true
      job.save
      
      if job.jobable
        jobber_class = (job.jobable.class.to_s.split(/(.*?)Job/)[1] + "Jobable").classify.constantize
      else
        return
      end

      #jobber = jobber_class.new(concrete_job)
      #Delayed::Job.enqueue ReceiveJobber.new(ImportJob.first)

      Delayed::Job.enqueue jobber_class.new(job, job.jobable, optional)
      #jobber_class.new(job, job.jobable, optional).perform

      #rescue => e
      #  return
      end
  end
end
