#require 'mail'
require 'net/pop'
#require 'tlsmail'

class EmailReceiver < AbstractReceiver

  def receive

    retval = Array.new()
    case @receiver.protocol
      when 'pop3'
        if @receiver.ssl?
          Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
        else
          Net::POP3.disable_ssl
        end

        group_code = 'r' + Time.now.to_s
        
        Net::POP3.start(@receiver.server, @receiver.port, @receiver.login, @receiver.password) do |pop|
          # pop.set_debug_output $stderr
          pop.mails.reverse.each_with_index do |email, index|
            unless index > AppConfig.max_emails

              net_popmail = email.pop

              email_id = @receiver.login + " - " + @receiver.server + ":" + @receiver.port + " " + Time.zone.now.to_s + " " + rand.to_s
              begin
                FileUtils::mkdir(Rails.root.to_s + '/public/system/emails')
              rescue Errno::EEXIST 
              end

              tempfile = File.open(Rails.root.to_s + '/public/system/emails/' + email_id, 'w')
                tempfile.write net_popmail
              tempfile.close

              #mail = Notifier.receive(net_popmail)
              mail = TMail::Mail.parse(net_popmail)


              unless mail.attachments.nil? 
                mail.attachments.each do |attachment|
                  md5 =  Digest::MD5.hexdigest(attachment.string)
                  #wc_stat = `echo "#{attachment.string}" | wc`

                  # attachment.original_filename
                  if (@optional.present? && @optional[:force]) || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?

                    attachment = SupplierPrice.new(:group_code => group_code, :attachment => attachment, :email_id => email_id, :md5 => md5, :wc_stat => email_id)
                    attachment.supplier = @job.supplier
                    attachment.job_code = @job.title
                    attachment.job_id = @job.id
                    attachment.save

                    retval << attachment.id
                    #@receiver.receive_job.job.childs.each do |child|
                    #  # а что если тут смотреть дочерние правила с фильтрами мыла?
                    #  JobWalker.new.start_job(child, @priority, attachment.id)
                    #end

                  end
                end
              end
            end
            email.delete
          end
        end
      when 'imap'
        raise Exception
      else
        raise Exception
    end
    return retval
  end
end
