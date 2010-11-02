require 'net/http'

class HttpReceiver < AbstractReceiver
  def receive
     Timeout.timeout(AppConfig.http_timeout) do

      http = Net::HTTP.new(@receiver.server, @receiver.port)

      if(@receiver.ssl)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request = Net::HTTP::Get.new(@receiver.path + @job.file_mask)
      request.initialize_http_header({"User-Agent" => "avtorif"})

      response = http.request(request)
      unless response.is_a? Net::HTTPOK
        raise response.message
      end
      
      remote_file = RemoteFile.new(@job.file_mask)

      remote_file.write response.body
      remote_file.flush
      md5 = Digest::MD5.file(remote_file.path).hexdigest

      retval = Array.new()

      if @optional[:force] || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
        attachment = SupplierPrice.new(:attachment => remote_file, :md5 => md5)
        attachment.supplier = @job.supplier
        attachment.job_code = @job.job_code
        attachment.job_id = @job.id
        attachment.save

        retval << attachment.id

        #@receiver.receive_job.job.childs.each do |child|
        #  JobWalker.new.start_job(child, attachment.id)
        #end

      end

      remote_file.unlink

    return retval

  end


  end
end