class FilterJobable < AbstractJobber
  def perform
    retval = []
    @optional.each do |opt|
      supplier_price = SupplierPrice.find(opt).attachment
      remote_file = RemoteFile.new(@job.job_code)
      remote_file_name = @job.job_code

      options = Hash.new
      #puts @jobable.quote_char
      #puts eval(@jobable.quote_char)

      if @jobable.col_sep.present?
        case @jobable.col_sep
          when "1"
            options[:col_sep] = ";"
          when "2"
            options[:col_sep] = "\t"
          when "3"
            options[:col_sep] = ","
          when "4"
            options[:col_sep] = "|"
        end
      end

      if @jobable.quote_char.present?
        case @jobable.quote_char
          when "1"
            options[:quote_char] =  "\x0"
          when "2"
            options[:quote_char] =  "\""
        end
      end


      #options[:row_sep] = "\r\n"

      begin
        FasterCSV.foreach(supplier_price.path, options)  do |row|
          if(
            (@jobable.first.present? ? row[0] =~ Regexp.new(@jobable.first) : true) &&
            (@jobable.second.present? ? row[1] =~ Regexp.new(@jobable.second) : true) &&
            (@jobable.third.present? ? row[2] =~ Regexp.new(@jobable.third) : true) &&
            (@jobable.fourth.present? ? row[3] =~ Regexp.new(@jobable.fourth) : true) &&
            (@jobable.fifth.present? ? row[4] =~ Regexp.new(@jobable.fifth) : true) &&
            (@jobable.sixth.present? ? row[5] =~ Regexp.new(@jobable.sixth) : true) &&
            (@jobable.seventh.present? ? row[6] =~ Regexp.new(@jobable.seventh) : true) &&
            (@jobable.eighth.present? ? row[7] =~ Regexp.new(@jobable.eighth) : true) &&
            (@jobable.ninth.present? ? row[8] =~ Regexp.new(@jobable.ninth) : true) &&
            (@jobable.tenth.present? ? row[9] =~ Regexp.new(@jobable.tenth) : true)
          )then
            remote_file.write(row.to_csv)

          end
        end
      rescue => e
        raise e.to_s + " in " + supplier_price.path
      end

      remote_file.flush
      md5 = Digest::MD5.file(remote_file.path).hexdigest
      wc_stat = `wc #{remote_file.path.to_s.shellescape}`

      attachment = SupplierPrice.new(:group_code => 'f' + @optional.to_s, :attachment => remote_file, :wc_stat => wc_stat)
      attachment.supplier = @job.supplier
      attachment.job_code = @job.job_code
      attachment.job_id = @job.id
      attachment.save
      remote_file.close

      retval << attachment.id
    end

    self.optional = retval
    super
  
  end
end
