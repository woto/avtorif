require 'net/ftp'

class FtpReceiver < AbstractReceiver
  def receive
    Timeout.timeout(AppConfig.ftp_timeout) do

      ftp = Net::FTP.new
      #ftp.debug_mode = false
      ftp.connect(@receiver.server, @receiver.port)
      ftp.passive = true
      ftp.login(@receiver.login, @receiver.password)
      ftp.chdir(@receiver.path)

      files = ftp.nlst
      #TODO сделать каким-то образом проверку на eval
      
      files = files.select { |file|
        file != '.' and
        file != '..' and
        file =~ Regexp.new(eval(@job.file_mask)) }

      retval = Array.new()

      group_code = 'r' + Time.now.to_s
      
      files.each do |file|
        #file = file.split(/\s/)[-1]
        remote_file = RemoteFile.new(file)
        ftp.getbinaryfile(file, remote_file.path)
        remote_file.flush        
        md5 = Digest::MD5.file(remote_file.path).hexdigest
        wc_stat = `wc #{remote_file.path.to_s.shellescape}`

        if (@optional.present? && @optional[:force]) || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
          attachment = SupplierPrice.new(:group_code => group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          #@receiver.receive_job.job.childs.each do |child|
          #  JobWalker.new.start_job(child, attachment.id)
          #end
        end

        remote_file.unlink

      end
    ftp.close

    return retval
      
  end


  end
end
