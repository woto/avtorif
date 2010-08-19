require 'net/pop'

class EmailReceiver < AbstractReceiver
  def receive
    Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
    Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password) do |pop|
      pop.mails.each do |email|
        #if email == pop.mails.last then
          begin
            #  logger.info "receiving mail..."
            mail = Notifier.receive(email.pop)
            mail.attachments.each do |attachment|
            #if !mail.attachments.blank?
              #logger.info attachment.original_filename

              #tmpfile = Tempfile.new(attachment.original_filename)
              #tmpfile << attachment.read
              remote_file = RemoteFile.new(attachment.original_filename)
              md5 =   Digest::MD5.hexdigest(File.read(remote_file.path))
              remote_file << attachment.read
              #              FileUtils.copy_stream(tmpfile, remote_file)
              #tmpfile.unlink
              #remote_file.original_filename = attachment.original_filename
              attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
              attachment.supplier = @receiver.receive_job.job.supplier
              attachment.save
              remote_file.unlink
              #File.open(local_file,"w+") { |local_file|
              #  local_file << mail.attachments.first.read
              #  #puts attachment.original_filename
              #}
            end
          end

            # email.delete
          #  rescue Exception => e
          #    logger.error "Error receiving email at " + Time.now.to_s + "::: " + e.message
          #  end
        #end
      end
    end
    #  end
    #  logger.info "Finished Mail Importer."
  end
end