class AbstractJobber
  def initialize(jobber)
     @jobber = jobber
  end

  def perform
    raise Exception
  end

end