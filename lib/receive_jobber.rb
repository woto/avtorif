class ReceiveJobber < AbstractJobber
  def perform
      concrete_receive = @jobber.receiveable_type.classify.constantize.find(@jobber.receiveable_id)
      receiver_class = (@jobber.receiveable_type.split(/(.*?)Receive/)[2] + "Receiver").classify.constantize
      receiver = receiver_class.new(concrete_receive)
      receiver.receive
  end
end


=begin

require 'rubygems'
require 'net/ftp'
require 'fileutils'

require 'net/pop'



class AbstractReceiver
  def receive
    raise Exception 'override receive method'
  end
end

class FtpReceiver < AbstractReceiver
  def receive
    @ftp.chdir(@path)

  end
end

class EmailReceiver < AbstractReceiver
  def initialize(popserver)
    @popserver = popserver
    # TODO 2
  end

  def receive(username, password, file_mask, local_file)
    #  logger.info "Running Mail Importer..."
    Net::POP3.start(@popserver, nil, username, password) do |pop|
    #   if pop.mails.empty?
    #     logger.info "NO MAIL"
    #   else
      pop.mails.each do |email|
        if email == pop.mails.last then
          begin
            #  logger.info "receiving mail..."
            mail = Notifier.receive(email.pop)
            mail.attachments.each do |attachment|
            #if !mail.attachments.blank?
              #logger.info attachment.original_filename
              File.open(local_file,"w+") { |local_file|
                local_file << mail.attachments.first.read
                #puts attachment.original_filename
              }
            end
          end

            # email.delete
          #  rescue Exception => e
          #    logger.error "Error receiving email at " + Time.now.to_s + "::: " + e.message
          #  end
        end
      end
    end
    #  end
    #  logger.info "Finished Mail Importer."
  end
end

=end