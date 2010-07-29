class ReceivePrice


  def self.download_from_email

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