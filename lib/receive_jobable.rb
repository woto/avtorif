class ReceiveJobable < AbstractJobber
  def perform
    receiver_class = (@jobable.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    receiver = receiver_class.new(@job, @jobable, @jobable.receiveable, @optional)
    self.optional = receiver.receive
    super
  end
end