class ReceiveJobber < AbstractJobber
  def perform
    receiver_class = (@jobber.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    receiver = receiver_class.new(@jobber.receiveable, @optional)
    receiver.receive
    super
  end
end