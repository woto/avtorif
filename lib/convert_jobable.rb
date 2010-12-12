class ConvertJobable < AbstractJobber

  def perform
    #unpack_class = (@jobable.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    #receiver = receiver_class.new(@job, @jobable, @jobable.receiveable, opt)
    #self.optional = receiver.receive
    retval = Array.new()
    @optional.each do |opt|

      supplier_price = SupplierPrice.find(opt).attachment

      #puts @jobable.convert_method
      case @jobable.convert_method.to_s
        when /_csv_encode_/
          remote_file = RemoteFile.new(supplier_price.path)

          encode(@jobable.encoding_in, @jobable.encoding_out, supplier_price.path.shellescape, remote_file.path.shellescape)


          md5 = Digest::MD5.file(remote_file.path).hexdigest
          wc_stat = `wc #{remote_file.path.to_s.shellescape}`

          remote_file.original_filename = File.basename(supplier_price.original_filename)

          attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          remote_file.unlink
=begin        
        when /csv_tr/
=end        
        when /csv_normalize_new_line/
          #puts supplier_price.original_filename
          remote_file = RemoteFile.new(supplier_price.path)

          file = File.new(supplier_price.path, 'r')
          file.each_line("\n") do |row|
            #row.gsub!("\"", "")
            row.gsub!("\r", "")
            row.gsub!("\n", "")
            unless row.empty?
                #remote_file.write(row.split(eval("\"#{@jobable.col_sep.to_s}\"")).collect(&:strip).to_csv )
                remote_file.write(row+"\r\n")
            else
              next
            end
          end

          remote_file.flush

          md5 = Digest::MD5.file(remote_file.path).hexdigest
          wc_stat = `wc #{remote_file.path.to_s.shellescape}`

          remote_file.original_filename = File.basename(supplier_price.original_filename)

          attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          remote_file.unlink
        
        when /python_xls2csv/
          Dir.mktmpdir do |tempdir|
            exec = "#{Rails.root}/external_tools/py_xls2csv #{tempdir} #{@jobable.encoding_out} #{supplier_price.path}"
            `#{exec}`
            unless $?.success?
              raise "Error during execution of #{exec}"
            end

            files = Dir.entries(tempdir) - ['.', '..']

            files.each do |file|

              remote_file = File.new(tempdir + "/" + file)

              remote_file.instance_eval("
                def original_filename()
                    \"#{File.basename(supplier_price.original_filename) + " - " + File.basename(remote_file.path)}.csv\"
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

              attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
              attachment.supplier = @job.supplier
              attachment.job_code = @job.title
              attachment.job_id = @job.id
              attachment.save

              retval << attachment.id
            end
          end 
        when /xls_roo/
          if(@jobable.encoding_out).present? && @jobable.encoding_out.to_s != 'AUTO'
            Spreadsheet.client_encoding = @jobable.encoding_out.to_s
          end

          begin
            s = Excel.new(supplier_price.path)
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

            remote_file.original_filename = File.basename(supplier_price.original_filename) + " - " + sheet + ".csv"

            attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
            attachment.supplier = @job.supplier
            attachment.job_code = @job.title
            attachment.job_id = @job.id
            attachment.save

            retval << attachment.id

            remote_file.unlink
          end
        when /xls_console/

          remote_file = RemoteFile.new(supplier_price.path)

          `xls2csv -q3 #{supplier_price.path.shellescape} > #{remote_file.path.shellescape}`
          md5 = Digest::MD5.file(remote_file.path).hexdigest
          wc_stat = `wc #{remote_file.path.to_s.shellescape}`

          remote_file.original_filename = File.basename(remote_file.original_filename, File.extname(remote_file.original_filename))

          attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.title
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          remote_file.unlink

        when /mdb_console/

          a = `mdb-tables #{supplier_price.path.shellescape}`
          a.split(' ').each do |table|
            remote_file = RemoteFile.new(table)
            `mdb-export #{supplier_price.path.shellescape} #{table.shellescape} > #{remote_file.path.shellescape}`
            remote_file.original_filename = File.basename(supplier_price.original_filename) + " - " + table + ".csv"
            md5 = Digest::MD5.file(remote_file.path).hexdigest
            wc_stat = `wc #{remote_file.path.to_s.shellescape}`

            attachment = SupplierPrice.new(:group_code => 'c' + @optional.to_s, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
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

  private

  def encode(encoding_in, encoding_out,  source, destination)

    if encoding_in.present?
      encoding_in = "-f #{encoding_in}"
    end

    if encoding_out.present?
      encoding_out = "-t #{encoding_out}//IGNORE"
    end

    `iconv #{encoding_in} #{encoding_out} #{source} > #{destination}`
    if $?.to_i != 0
      raise 'Ошибка перекодирования в iconv вероятно входная кодировка выставлена неверно, id задачи ' + @job.id.to_s + "\r\niconv #{encoding_in} #{encoding_out} #{source} > #{destination}"
    end
  end
end
