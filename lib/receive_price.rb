class ReceivePrice
  def self.download_from_ftp
    require 'rubygems'
    require 'net/ftp'
    require 'fileutils'

    url = 'avtorif.ru'
    username = 'lucid'
    passwd = "Kl32r5x0"
    filename = "tmp.xls"
    directory = '/'
    localfile = '/home/woto/rails/tmp.xls'
    ftp=Net::FTP.new
    ftp.connect(url,21)
    ftp.login(username,passwd)
    ftp.chdir(directory)
    ftp.getbinaryfile(filename,localfile)
    ftp.close
  end

  def self.download_from_email
    require 'net/pop'
    require File.dirname(__FILE__) + '/../config/environment'

    logger = RAILS_DEFAULT_LOGGER

    logger.info "Running Mail Importer..."
    Net::POP3.start("mail.avtorif.ru", nil, "webmaster", "zBsnAbfhxY") do |pop|
      if pop.mails.empty?
        logger.info "NO MAIL"
      else
        pop.mails.each do |email|
          if email == pop.mails.last then
            begin
              logger.info "receiving mail..."
              Notifier.receive(email.pop)
              #email.delete
            rescue Exception => e
              logger.error "Error receiving email at " + Time.now.to_s + "::: " + e.message
            end
          end
        end
      end
    end
    logger.info "Finished Mail Importer."
  end

  def self.send_email

msgstr = <<EOF
From: c1@example.org
To: c2@avtorif.ru
Cc: c3@example.org
Bcc: c4@example.org
Subject: Test BCC

This is a test message.
EOF

    require 'net/smtp'
    smtp = Net::SMTP.new('mail.avtorif.ru', 25)
    smtp.start('localhost', 'webmaster', 'zBsnAbfhxY', :login) do |smtp|
      smtp.send_message msgstr, 'webmaster@avtorif.ru',
                        'webmaster@avtorif.ru'      
#      smtp.send_message msgstr, 'from@example.org',
#                        'webmaster@avtorif.ru', 'cc@example.org', 'bcc@example.org'
    end
  end

  def perform
    dddd
    ReceivePrice.send_email
  end

end

require File.dirname(__FILE__) + '/../config/environment'
Delayed::Job.enqueue(ReceivePrice.new)