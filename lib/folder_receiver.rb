class FolderReceiver < AbstractReceiver
  def receive
    Timeout.timeout(AppConfig.folder_timeout) do

      files = Dir.entries(@receiver.path)
      files = files.select { |file| file =~ Regexp.new(@receiver.receive_job.job.file_mask) }
      files.each do |file|
        
        remote_file = RemoteFile.new(file)
        FileUtils.copy_stream File.open(@receiver.path + "/" + file), remote_file
        remote_file.flush
        md5 = Digest::MD5.file(remote_file.path).hexdigest

        if SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @receiver.receive_job.job.supplier.id]).nil?
          attachment = SupplierPrice.new(:attachment => remote_file, :md5 => md5)
          attachment.supplier = @receiver.receive_job.job.supplier
          attachment.job_code = @receiver.receive_job.job.job_code
          attachment.job_id = @receiver.receive_job.job.id
          attachment.save

          @receiver.receive_job.job.childs.each do |child|
            JobWalker.new.start_job(child, attachment.id)
          end

        end

        remote_file.unlink

      end


  end


  end
end