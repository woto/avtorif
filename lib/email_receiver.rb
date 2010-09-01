#require 'mail'
require 'net/pop'
#require 'tlsmail'

class EmailReceiver < AbstractReceiver

  def receive
    case @receiver.protocol
      when 'pop3'
        Pop3Receiver.receive @receiver
      when 'imap'
        ImapReceiver.receive @receiver
    end
  end
  
end
