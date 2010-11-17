class FolderReceiver < AbstractReceiver
  def receive
    Timeout.timeout(AppConfig.folder_timeout) do

      files = Dir.entries(@receiver.path)
      files = files - ['.', '..'] 
      files = files.select { |file| file =~ Regexp.new(eval(@job.file_mask)) }
      retval = Array.new()

      group_code = 'r' + Time.now.to_s
      
      files.each do |file|
        remote_file = RemoteFile.new(file)
        FileUtils.copy_stream File.open(@receiver.path + "/" + file), remote_file
        remote_file.flush
        md5 = Digest::MD5.file(remote_file.path).hexdigest
        wc_stat = `wc #{remote_file.path.to_s.shellescape}`        

        if (@optional.present? && @optional[:force]) || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
          attachment = SupplierPrice.new(:group_code => group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.job_code
          attachment.job_id = @job.id
          attachment.save

          #@job.childs.each do |child|
          #  JobWalker.new.start_job(child, attachment.id)
          #end

          retval << attachment.id

        end

        remote_file.unlink

      end

      return retval      

  end


  end
end