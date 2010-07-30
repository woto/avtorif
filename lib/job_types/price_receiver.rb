require 'rubygems'
require 'net/ftp'
require 'fileutils'

require 'net/pop'




class PriceReceiver
  def initialize(receiver, username, password, file_mask, local_file)
    unless receiver.is_a? AbstractReceiver
      raise Exception 'Must be derived from AbstractReceiver'
    end
    receiver.receive(username, password, file_mask, local_file)
  end
end

class AbstractReceiver
  def receive
    raise Exception 'override receive method'
  end
end

class FtpReceiver < AbstractReceiver
  def initialize(url, path, port = 21)
    @ftp=Net::FTP.new
    @ftp.connect(url,port)
    @remote_path = path
  end

  def receive(username, password, file_mask, local_file)
    @ftp.login(username, password)
    @ftp.chdir(@remote_path)
    files = @ftp.list
    files = files.select { |file| file =~ file_mask }
    # TODO 1
    if files.count > 1
      raise Exception 'Found more than one file, specify more precisely mask'
    end
    file = files[0].split(/\s/)[-1]
    @ftp.getbinaryfile(file, local_file)
    @ftp.close
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


#HttpReceiver = ''
#FtpReceiver = ''
#FolderReceiver = ''
#=end

ftp = FtpReceiver.new('avtorif.ru', '/')
email = EmailReceiver.new('mail.avtorif.ru')

#pr = PriceReceiver.new(ftp, 'lucid', 'Kl32r5x0', /tmp.xls/, '/home/woto/rails/tmp.xls')
pr = PriceReceiver.new(email, "webmaster", 'zBsnAbfhxY', /.*/, '/home/woto/rails/tmp2.xls')
