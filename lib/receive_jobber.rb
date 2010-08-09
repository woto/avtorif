class ReceiveJobber < AbstractJobber
  def perform
    concrete_receive = @jobber.receiveable
    receiver_class = (@jobber.receiveable_type.split(/(.*?)Receive/)[2] + "Receiver").classify.constantize
    receiver = receiver_class.new(concrete_receive)
    receiver.receive
  end
end