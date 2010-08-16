class AbstractReceiver
  def initialize(receiver, optional = nil)
    @receiver = receiver
    @optional = optional
  end

  def receive
    raise Exception
  end

end