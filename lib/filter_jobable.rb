class FilterJobable < AbstractJobber
  def perform
    supplier_price = SupplierPrice.find(@optional).attachment
    remote_file = RemoteFile.new(@job.job_code)
    remote_file_name = @job.job_code

    FasterCSV.foreach(supplier_price.path, { :col_sep => @jobable.col_sep})  do |row|
      puts row
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

    remote_file.flush
    md5 = Digest::MD5.file(remote_file.path).hexdigest
    attachment = SupplierPrice.new(:attachment => remote_file)
    attachment.supplier = @job.supplier
    attachment.job_code = @job.job_code
    attachment.job_id = @job.id
    attachment.save
    remote_file.close
    self.optional = [attachment.id]
    super
  
  end
end