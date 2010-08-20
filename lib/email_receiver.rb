require 'net/pop'

class EmailReceiver < AbstractReceiver
  def receive

    OpenSSL::SSL::SSLError

    Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
    pop = Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password)
    
      #pop.reset

        pop.mails.reverse.each do |email|
          mail = Notifier.receive(email.pop)
          !mail.attachments.nil? && mail.attachments.reverse.each do |attachment|

            remote_file = RemoteFile.new(attachment.original_filename)
            remote_file << attachment.read
            md5 =   Digest::MD5.hexdigest(File.read(remote_file.path))

            if Attachment.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @receiver.receive_job.job.supplier.id]).nil?

              attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
              attachment.supplier = @receiver.receive_job.job.supplier
              attachment.save

              @receiver.receive_job.job.childs.each do |child|
                JobWalker.new.start_job(child, attachment.id)
              end

              email.delete
              
            end

            remote_file.unlink

          end

        end

        #pop.reset

  end
end