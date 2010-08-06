class AbstractReceiver
begin
  def initialize(receiver)
    @receiver = receiver 
  end

  def receive
    raise Exception
  end

end