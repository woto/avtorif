class CrawlerReceiver < AbstractReceiver
  def receive
    instance_eval @receiver.instructions
  end
end
