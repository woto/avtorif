class AbstractReceiver
  def initialize(job, jobable, receiver, optional = nil)
    @job = job
    @jobable = jobable
    @receiver = receiver
    @optional = optional
  end

  def receive
    raise Exception
  end

end