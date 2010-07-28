class Notifier < ActionMailer::Base
  def receive(mail)
    mail.attachments.each do |attachment|
    #if !mail.attachments.blank?
      logger.info attachment.original_filename
      File.open(attachment.original_filename,"w+") { |local_file|
        local_file << mail.attachments.first.read
        #puts attachment.original_filename
      }
    end
  end
end
