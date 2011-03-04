class ConvertJobable < AbstractJobber
  
  def python_excel(exec)
    retval = Array.new
    Dir.mktmpdir do |tempdir|
      stdin, stdout, stderr = Open3.popen3(exec + " -t #{tempdir}")
      if (error_string = stderr.read).present?
        raise "'#{error_string}' в результате запуска '#{exec}'"
      end

      files = Dir.entries(tempdir) - ['.', '..']
      files.each do |file|
        remote_file = File.new(tempdir + "/" + file)
	# Тут еще потом повырезать символы, которые не могут содержаться в имени файла
        remote_file.instance_eval("
          def original_filename()
              \"#{File.basename(@supplier_price.original_filename).gsub('"', '') + " - " + File.basename(remote_file.path).gsub('"', '')}.csv\"
          end

          def content_type()
            mime = `file --mime -br #{remote_file.path.shellescape.shellescape}`.strip
            mime = mime.gsub(/^.*: */,\"\")
            mime = mime.gsub(/;.*$/,\"\")
            mime = mime.gsub(/,.*$/,\"\")
            mime
          end
        ")

        md5 = Digest::MD5.file(remote_file.path).hexdigest
        wc_stat = `wc #{remote_file.path.to_s.shellescape}`

        attachment = SupplierPrice.new(:group_code => @group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
        attachment.supplier = @job.supplier
        attachment.job_code = @job.title
        attachment.job_id = @job.id
        attachment.save

        retval << attachment.id
      end
    end 
    return retval
  end

  def perform

    @group_code = 'c' + @optional.to_s + Time.now.to_s
    retval = Array.new()

    @optional.each do |opt|

      @supplier_price = SupplierPrice.find(opt).attachment

      case @jobable.convert_method.to_s
        when /_arbitrary_console_/
          remote_file = RemoteFile.new(File.basename(@supplier_price.original_filename))
          exec = @jobable.exec_string.dup
          exec["[in_file]"] = @supplier_price.path.shellescape
          exec["[out_file]"] = remote_file.path.shellescape
          stdin, stdout, stderr = Open3.popen3(exec)
          if (error_string = stderr.read).present?
            raise "'#{error_string}' в результате запуска '#{exec}'"
          end

          md5 = Digest::MD5.file(remote_file.path).hexdigest
          wc_stat = `wc #{remote_file.path.to_s.shellescape}`
          head_stat = `head #{remote_file.path.to_s.shellescape}`

          remote_file.original_filename = File.basename(@supplier_price.original_filename)

          attachment = SupplierPrice.new(:group_code => @group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          remote_file.unlink

        when /xlrd/
          retval = retval + python_excel("#{Rails.root}/system/external_tools/xlrd_xls2csv.py -e #{@jobable.encoding_out} -i #{@supplier_price.path.shellescape}")
        when /pyExcelerator/
          retval = retval + python_excel("#{Rails.root}/system/external_tools/pyExcelerator_xls2csv.py -e #{@jobable.encoding_out} -i #{@supplier_price.path.shellescape}")
        when /dilshod_temirkhodjaev_xlsx2csv/
          retval = retval + python_excel("#{Rails.root}/system/external_tools/dilshod_temirkhodjaev_xlsx2csv.py #{@supplier_price.path.shellescape}")
        when /mdb_console/

          a = `mdb-tables #{@supplier_price.path.shellescape}`

          a.split(' ').each do |table|
            remote_file = RemoteFile.new(table)
            `mdb-export #{@supplier_price.path.shellescape} #{table.shellescape} > #{remote_file.path.shellescape}`
            remote_file.original_filename = File.basename(@supplier_price.original_filename) + " - " + table + ".csv"
            md5 = Digest::MD5.file(remote_file.path).hexdigest
            wc_stat = `wc #{remote_file.path.to_s.shellescape}`

            attachment = SupplierPrice.new(:group_code => @group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
            attachment.supplier = @job.supplier
            attachment.job_code = @job.title
            attachment.job_id = @job.id
            attachment.save

            retval << attachment.id
            remote_file.unlink
            
          end
          
        else
          raise 'Unknown convert method: ' + @jobable.convert_method.to_s
      end
    end
    self.optional = retval
    super

  end

end
