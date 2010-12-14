class FilterJobable < AbstractJobber
  def perform
    retval = []
    @optional.each do |opt|
      supplier_price = SupplierPrice.find(opt).attachment
      remote_file = RemoteFile.new(File.basename(supplier_price.original_filename) + ".csv")
      #remote_file_name = supplier_price.@job.title + ".csv"

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


      if @jobable.row_sep.present?
        case @jobable.row_sep
          when "1"
            options[:quote_char] =  "\x0d"
          when "2"
            options[:quote_char] =  "0d"
        end
      end

      #options[:row_sep] = "\r\n"

      #begin

            boolean_first = @jobable.first.present?
            regexp_first = Regexp.new(@jobable.first)

            boolean_second = @jobable.second.present? 
            regext_second = Regexp.new(@jobable.second)

            boolean_third = @jobable.third.present? 
            regexp_third = Regexp.new(@jobable.third)

            boolean_fourth = @jobable.fourth.present?
            regext_fourth = Regexp.new(@jobable.fourth)

            boolean_fifth = @jobable.fifth.present?
            regexp_fifth = Regexp.new(@jobable.fifth)

            boolean_sixth = @jobable.sixth.present?
            regexp_sixth = Regexp.new(@jobable.sixth)

            boolean_seventh = @jobable.seventh.present?
            regexp_seventh = Regexp.new(@jobable.seventh)

            boolean_eighth = @jobable.eighth.present?
            regexp_eighth = Regexp.new(@jobable.eighth)

            boolean_ninth = @jobable.ninth.present?
            regexp_ninth = Regexp.new(@jobable.ninth)

            boolean_tenth = @jobable.tenth.present?
            regexp_tenth = Regexp.new(@jobable.tenth)
        
        i = 0
        FasterCSV.foreach(supplier_price.path, options)  do |row|
          i = i+1
          puts i if i.modulo(10000) == 0
          if(1
#            (boolean_first.present? ? row[0] =~ regexp_first : true) &&
#            (boolean_second.present? ? row[1] =~ regexp_second : true) &&
#            (boolean_third.present? ? row[2] =~ regexp_third : true) &&
#            (boolean_fourth.present? ? row[3] =~ regexp_fourth : true) &&
#            (boolean_fifth.present? ? row[4] =~ regexp_fifth : true) &&
#            (boolean_sixth.present? ? row[5] =~  regexp_sixth : true) &&
#            (boolean_seventh.present? ? row[6] =~ regexp_seventh : true) &&
#            (boolean_eighth.present? ? row[7] =~ regexp_eighth : true) &&
#            (boolean_ninth.present? ? row[8] =~ regexp_ninth : true) &&
#            (boolean_tenth.present? ? row[9] =~ regexp_tenth : true)
          )then
            #remote_file.write(row.to_csv)
          row.to_csv
          puts i if i.modulo(20000) == 0

          end
        end
      #rescue => e
      #  raise e.to_s + " in " + supplier_price.path
      #end

      remote_file.flush
      md5 = Digest::MD5.file(remote_file.path).hexdigest
      wc_stat = `wc #{remote_file.path.to_s.shellescape}`

      attachment = SupplierPrice.new(:group_code => 'f' + @optional.to_s, :attachment => remote_file, :wc_stat => wc_stat)
      attachment.supplier = @job.supplier
      attachment.job_code = @job.title
      attachment.job_id = @job.id
      attachment.save
      remote_file.close

      retval << attachment.id
    end

    self.optional = retval
    super
  
  end
end
