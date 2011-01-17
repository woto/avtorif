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
        remote_file.instance_eval("
          def original_filename()
              \"#{File.basename(@supplier_price.original_filename) + " - " + File.basename(remote_file.path)}.csv\"
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
        when /_csv_encode_/
          raise 'Obsolete'
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

        when /csv_normalize_new_line/
          raise 'Obsolete'          
        when /python_xls2csv/
          retval = python_excel("#{Rails.root}/system/external_tools/pyExcelerator_xls2csv.py -e #{@jobable.encoding_out} -i #{@supplier_price.path.shellescape}")
        when /dilshod_temirkhodjaev_xlsx2csv/
          retval = python_excel("#{Rails.root}/system/external_tools/dilshod_temirkhodjaev_xlsx2csv.py #{@supplier_price.path.shellescape}")
        when /xls_roo/
          if(@jobable.encoding_out).present? && @jobable.encoding_out.to_s != 'AUTO'
            Spreadsheet.client_encoding = @jobable.encoding_out.to_s
          end

          begin
            s = Excel.new(@supplier_price.path)
          rescue => e
            raise e.to_s + "in file #{opt.to_s}"
          end

          if(@jobable.encoding_in).present? && @jobable.encoding_in.to_s != 'AUTO'
            s.encoding = @jobable.encoding_in.to_s
          end

          s.sheets.each do |sheet|
            remote_file = RemoteFile.new(sheet)
            s.default_sheet = sheet
            s.to_csv(remote_file.path)
            md5 = Digest::MD5.file(remote_file.path).hexdigest
            wc_stat = `wc #{remote_file.path.to_s.shellescape}`

            remote_file.original_filename = File.basename(@supplier_price.original_filename) + " - " + sheet + ".csv"

            attachment = SupplierPrice.new(:group_code => @group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
            attachment.supplier = @job.supplier
            attachment.job_code = @job.title
            attachment.job_id = @job.id
            attachment.save

            retval << attachment.id

            remote_file.unlink
          end
        when /xls_console/
          raise 'Obsolete'
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
          raise 'Unknown convert method'
      end
    end
    self.optional = retval
    super

  end

end
