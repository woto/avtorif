require 'net/ftp'

class FtpReceiver < AbstractReceiver
  def receive
    Timeout.timeout(120) do

      ftp = Net::FTP.new
      ftp.debug_mode = true
      ftp.connect(@receiver.server, @receiver.port)
      ftp.passive = true
      ftp.login(@receiver.login, @receiver.password)
      ftp.chdir(@receiver.path)

      files = ftp.list
      files = files.select { |file| file =~ Regexp.new(@receiver.receive_job.job.file_mask) }
      files.each do |file|
        file = file.split(/\s/)[-1]
        remote_file = RemoteFile.new(file)
        ftp.getbinaryfile(file, remote_file.path)
        md5 = Digest::MD5.hexdigest(File.read(remote_file.path))

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

    ftp.close

  end


  end
end