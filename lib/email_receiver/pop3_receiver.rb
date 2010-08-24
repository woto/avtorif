class Pop3Receiver
  def self.receive(receiver)
    @receiver = receiver
    
    if @receiver.ssl?
      Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
    end

      #pop = Net::POP3.new(@receiver.server, @receiver.port)
      #pop.start(@receiver.login, @receiver.password)

    pop = Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password)
    rescue Exception => e
      return e



=begin


    server = @receiver.server
    port = @receiver.port
    login = @receiver.login
    password = @receiver.password
    ssl = @receiver.ssl

    Mail.defaults do retriever_method :pop3, {
                                :address    => server,
                                :port       => port,
                                :user_name  => login,
                                :password   => password,
                                :enable_ssl => ssl }
    end
    emails = Mail.all
    emails.each do |email|
      puts email

    end


    pop = Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password)
      pop.use_ssl
      #pop.reset

=end



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

            end

            remote_file.unlink

          end

          email.delete
        end
        pop.finish
        #pop.reset
  end
end