require 'net/http'

class HttpReceiver < AbstractReceiver
  def receive
     Timeout.timeout(AppConfig.http_timeout) do

      http = Net::HTTP.new(@receiver.server, @receiver.port)

      http.read_timeout=AppConfig.http_timeout
      http.open_timeout=AppConfig.http_timeout


      if(@receiver.ssl)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request = Net::HTTP::Get.new(URI::escape(@receiver.path + @job.file_mask))
      request.initialize_http_header({"User-Agent" => "avtorif"})

      response = http.request(request)
      unless response.is_a? Net::HTTPOK
        raise response.message
      end

      # Нельзя так делать, т.к. нарушается логика
      #begin
      #  remote_file = RemoteFile.new(response['content-disposition'].match(/filename="(.*)"/)[1])
      #rescue
        remote_file = RemoteFile.new(@job.file_mask)
      #end

      group_code = 'r' + Time.now.to_s
      
      remote_file.write response.body
      remote_file.flush
      md5 = Digest::MD5.file(remote_file.path).hexdigest
      wc_stat = `wc #{remote_file.path.to_s.shellescape}`

      retval = Array.new()

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

    return retval

  end


  end
end
