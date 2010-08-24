#require 'mail'
require 'net/pop'
require 'tlsmail'
require 'email_receiver/pop3_receiver'
require 'email_receiver/imap_receiver'

class EmailReceiver < AbstractReceiver

  def receive
    raise InterfaceException, "Keyboard failure", caller
    
    proto = @receiver.proto
    case proto
      when 'pop3'
        Pop3Receiver.receive @receiver
      when 'imap'
        raise Exception 'not implemented'
    end
  end
  
end