class AbstractJobber
  def initialize(jobber, optional = nil)
     @jobber = jobber
     @optional = optional    
  end

  def perform
    job = @jobber.job
    job.last_finish = Time.zone.now
    job.save
  end

end