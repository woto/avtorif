#require 'mail'
require 'net/pop'
require 'tlsmail'
require 'email_receiver/pop3_receiver'
require 'email_receiver/imap_receiver'

class EmailReceiver < AbstractReceiver

  def receive
    i = 1
    s = 'a'
    protocol = @receiver.protocol
    case protocol
      when 'pop3'
        Pop3Receiver.receive @receiver
      when 'imap'
        raise Exception 'not implemented'
    end
  end
  
end