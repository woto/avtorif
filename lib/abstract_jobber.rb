#logger = RAILS_DEFAULT_LOGGER
#logger.level = Logger::ERROR

class AbstractJobber

  attr_writer :optional
  
  def initialize(job, jobable, optional = nil)
    @job = job
    @jobable = jobable
    @optional = optional
  end

  def perform
    #job = @jobable.job
    #job.last_finish = Time.zone.now
    @job.last_finish = Time.zone.now
    #job.locked = false
    @job.locked = false
    #job.save
    @job.save

    @job.childs.each do |job|
      @optional.each do |opt|
        JobWalker.new.start_job(job, opt)
      end
    end
    
  end
end