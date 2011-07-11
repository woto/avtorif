#logger.level = Logger::ERROR

class AbstractJobber
  attr_accessor :optional, :job, :jobable, :priority

  def enqueue(j)
    j.job_id = job.id
    j.save
    job.locked = true
    job.save
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Безусловный enqueue: '#{job.title}' от '#{job.supplier.title}'.")    
  end

  def before(j)
    sleep(3)
    job.last_start = Time.zone.now.to_s
    job.started_once = true
    job.save
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Безусловный before: '#{job.title}' от  '#{job.supplier.title}'.")    
    sleep(3)
  end

  def after(j)
    sleep(3)
    job.last_error = ''
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Безусловный after: '#{job.title}' от '#{job.supplier.title}'.")    
    sleep(3)
  end

  def success(j)
    sleep(3)
    job.locked = false
    job.last_finish = Time.zone.now.to_s
    job.last_error = ''
    job.save
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Условный success: '#{job.title}' от '#{job.supplier.title}'.")
    sleep(3)
  end

  def error(j, e)
    sleep(3)
    job.last_error = e.message
    job.save
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Условный error: '#{job.title}' от '#{job.supplier.title}'.")
    DELAYED_JOB_LOGGER.info(e.message)
    sleep(3)
  end

  def failure
    sleep(3)
    DELAYED_JOB_LOGGER.info(Time.zone.now.to_s + " Условный failure: '#{job.title}' от '#{job.supplier.title}'.")
    sleep(3)
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
      # Необходимо на случай если после импорта надо вызвать задачу приема
      elsif job.jobable.class == ReceiveJob
        JobWalker.new.start_job(job, @priority - 1, {:force => true})
      end
    end
  end
end
