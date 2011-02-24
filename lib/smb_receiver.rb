class SmbReceiver < AbstractReceiver

  def receive
    Timeout.timeout(AppConfig.smb_timeout) do
      str_password = @receiver.password
      str_login = @receiver.login
      str_port = @receiver.port.to_s
      str_server = @receiver.server.to_s[/^\/*(.*?)\/*$/, 1]
      str_share = @receiver.share.to_s[/^\/*(.*?)\/*$/, 1]
      str_path = @receiver.path.to_s[/^\/*(.*?)\/*$/, 1]
      result = `smbclient \/\/#{str_server}\/#{str_share}\/ #{str_password} -U #{str_login} -p #{str_port} -c \"cd \\\"#{str_path}\\\"\; dir\;\"`
      raise result if result =~ /NT_STATUS_BAD_NETWORK_NAME|NT_STATUS_LOGON_FAILURE|NT_STATUS_OBJECT_NAME_NOT_FOUND|NT_STATUS_UNSUCCESSFUL/
      files = result.split("\n")
      puts files
      #debugger
      files.collect! do |line|
        begin
          # Ничего лучше я придумать не смог :\
          line.scan(/(.*)?\s+A\s+\d+\s+\w+\s+\w+\s+\d+\s+\d{2}:\d{2}:\d{2}\s+\d{4}/)[0][0].strip
        rescue Exception => e
          false
        end
      end

      group_code = 'r' + Time.now.to_s

      #TODO сделать каким-то образом проверку на eval
      files = files.select { |file|
        file != '.' and
        file != '..' and
        file =~ Regexp.new(eval(@job.file_mask)) }

      retval = Array.new()

      files.each do |file|

        #TODO it's stupid, sorry
        remote_file = RemoteFile.new(file)
        remote_file_name = remote_file.path
        remote_file.unlink

        #str_share.gsub!(/ /, '\ ')
        #str_path.gsub!(/ /, '\ ')
        #file.gsub!(/ /, '\ ')

        `smbget smb:\/\/#{str_server}\/#{str_share.shellescape}\/#{str_path.shellescape}\/#{file.shellescape} -u #{str_login} -p #{str_password} -o \/#{remote_file_name} -q`
        remote_file = File.new(remote_file_name)

        remote_file.instance_eval("
          def original_filename()
              \"#{file.shellescape.to_s}\"
          end

          def content_type()
            mime = `file --mime -br #{remote_file.path}`.strip
            mime = mime.gsub(/^.*: */,\"\")
            mime = mime.gsub(/;.*$/,\"\")
            mime = mime.gsub(/,.*$/,\"\")
            mime
          end
        ")

        md5 = Digest::MD5.file(remote_file.path).hexdigest
        wc_stat = `wc #{remote_file.path.to_s.shellescape}`

        if (@optional.present? && @optional[:force]) || SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
          attachment = SupplierPrice.new(:group_code => group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          #attachment.wc_stat = wc_stat

          retval << attachment.id

          #@receiver.receive_job.job.childs.each do |child|
          #  JobWalker.new.start_job(child, attachment.id)
          #end

        end

        File.unlink remote_file.path

      end

      return retval

    end

  end
  
end
