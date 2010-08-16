class AbstractJobber
  def initialize(jobber, optional = nil)
     @jobber = jobber
     @optional = optional    
  end

  def perform
    raise Exception
  end

end