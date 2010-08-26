#require 'mail'
require 'net/pop'
#require 'tlsmail'

class EmailReceiver < AbstractReceiver

  def receive
    case @receiver.protocol
      when 'pop3'
        Pop3Receiver.receive @receiver
      when 'imap'
        raise Exception 'not implemented'
    end
  end
  
end
