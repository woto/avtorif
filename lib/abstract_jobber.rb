#logger.level = Logger::ERROR

class AbstractJobber
  attr_accessor :optional, :job, :jobable, :priority

  def enqueue(j)
    j.job_id = job.id
    j.save
    job.locked = true
    job.save
    Rails.logger.info(Time.zone.now.to_s + " Безусловный enqueue: '#{job.title}' от '#{job.supplier.title}'.")    
  end

  def before(j)
    job.last_start = Time.zone.now.to_s
    job.started_once = true
    job.save
    Rails.logger.info(Time.zone.now.to_s + " Безусловный before: '#{job.title}' от  '#{job.supplier.title}'.")    
  end

  def after(j)
    job.last_error = ''
    Rails.logger.info(Time.zone.now.to_s + " Безусловный after: '#{job.title}' от '#{job.supplier.title}'.")    
  end

  def success(j)
    job.locked = false
    job.last_finish = Time.zone.now.to_s
    job.last_error = ''
    job.save
    Rails.logger.info(Time.zone.now.to_s + " Условный success: '#{job.title}' от '#{job.supplier.title}'.")
  end

  def error(j, e)
    job.last_error = e.message
    job.save
    Rails.logger.info(Time.zone.now.to_s + " Условный error: '#{job.title}' от '#{job.supplier.title}'.")
    Rails.logger.info(e.message)
  end

  def failure
    Rails.logger.info(Time.zone.now.to_s + " Условный failure: '#{job.title}' от '#{job.supplier.title}'.")
  end

  def initialize(job, jobable, priority, optional = nil)
    @job = job
    @jobable = jobable
    @optional = optional
    @priority = priority
  end

  def perform
    @job.childs.active.each do |job|
      if @optional.size > 0
        JobWalker.new.start_job(job, @priority - 1, @optional)
      end
    end
  end
end
