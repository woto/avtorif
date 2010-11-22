#logger = RAILS_DEFAULT_LOGGER
#logger.level = Logger::ERROR

class AbstractJobber

  attr_writer :optional

  def failure(job)
    # https://github.com/collectiveidea/delayed_job hooks
  end

  def initialize(job, jobable, priority, optional = nil)
    @job = job
    @jobable = jobable
    @optional = optional
    @priority = priority
  end

  def perform
    #job = @jobable.job
    #job.last_finish = Time.zone.now
    @job.last_finish = Time.zone.now
    #job.locked = false
    @job.locked = false
    #job.save
    @job.save

    #TODO Тут сделать вызов либо at_once, либо one_by_one 
    @job.childs.active.each do |job|
      @optional.each do |opt|
        JobWalker.new.start_job(job, @priority, opt)
      end
    end
    
  end
end
