require 'net/pop'


class EmailReceiver < AbstractReceiver
  def receive
    Net::POP3.start(@receiver.server, nil, @receiver.login, @receiver.password) do |pop|
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