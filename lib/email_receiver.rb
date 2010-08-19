require 'net/pop'

class EmailReceiver < AbstractReceiver
  def receive
    Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
    Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password) do |pop|
      pop.mails.each do |email|
        mail = Notifier.receive(email.pop)
        !mail.attachments.nil? && mail.attachments.reverse.each do |attachment|
          remote_file = RemoteFile.new(attachment.original_filename)
          md5 =   Digest::MD5.hexdigest(File.read(remote_file.path))
          remote_file << attachment.read
          attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
          attachment.supplier = @receiver.receive_job.job.supplier
          attachment.save
          remote_file.unlink
        end
        email.delete
      end
    end
  end
end