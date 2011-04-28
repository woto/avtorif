logger = Rails::logger
logger.level = Logger::ERROR

class AbstractJobber

  attr_accessor :optional, :job, :jobable, :priority

  def enqueue(j)
    j.job_id = job.id
    j.save
    puts Time.zone.now.to_s + " Безусловный enqueue: '#{job.title}' от '#{job.supplier.title}'."
    job.locked = true
    job.save
  end

  def before(j)
    puts Time.zone.now.to_s + " Безусловный before: '#{job.title}' от  '#{job.supplier.title}'."
    job.last_start = Time.zone.now.to_s
    job.started_once = true
    job.save
  end

  def after(j)
    puts Time.zone.now.to_s + " Безусловный after: '#{job.title}' от '#{job.supplier.title}'."
    job.last_error = ''
  end

  def success(j)
    sleep(5)
    job.locked = false
    job.last_finish = Time.zone.now.to_s
    job.last_error = ''
    job.save
    puts Time.zone.now.to_s + " Условный success: '#{job.title}' от '#{job.supplier.title}'."
  end

  def error(j, e)
    job.last_error = e.message
    job.save
    puts Time.zone.now.to_s + " Условный error: '#{job.title}' от '#{job.supplier.title}'."
    puts e.message
  end

  def failure
    puts Time.zone.now.to_s + " Условный failure: '#{job.title}' от '#{job.supplier.title}'."
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
