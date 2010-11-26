require File.dirname(__FILE__) + '/../config/environment'
require File.dirname(__FILE__) + '/../config/boot'
require 'rubygems'
require 'rufus-scheduler'
require 'time'
require 'date'

#logger = Rails.logger
#logger.level = Logger::ERROR


class JobWalker

  def call
    jobs = Job
    #logger.error jobs.collect{|job| job.title}

    jobs.active.each do |job|
      if job.parent.blank? && (job.next_start.nil? || job.next_start < Time.zone.now) && !job.repeats.blank? && !job.locked
        # Запускаем задачи, у которых время следующего запуска меньше текущего
        start_job(job, 100)
      end
    end
  end

  def start_job(job, priority, optional = nil)
      if optional.is_a?(Array)
        grepped_optional = []
        optional.each do |opt|
          supplier_price = SupplierPrice.find(opt)
          if supplier_price.attachment.original_filename =~ Regexp.new(eval(job.file_mask))
            grepped_optional << supplier_price.id
          end
        end
      optional = grepped_optional
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
        job.save

        if job.jobable.present?
          jobber_class = (job.jobable.class.to_s.split(/(.*?)Job/)[1] + "Jobable").classify.constantize
          Delayed::Job.enqueue(jobber_class.new(job, job.jobable, priority, optional), priority)
          #jobber_class.new(job, job.jobable, priority, optional).perform
        end

      #rescue => e
        #return
      end
  end
end
