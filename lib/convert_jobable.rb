class ConvertJobable < AbstractJobber
  def perform
    #unpack_class = (@jobable.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    #receiver = receiver_class.new(@job, @jobable, @jobable.receiveable, @optional)
    #self.optional = receiver.receive

    retval = Array.new()
    supplier_price = SupplierPrice.find(@optional).attachment

    remote_file = RemoteFile.new(supplier_price.path)
    
    `xls2csv -q2 #{supplier_price.path.shellescape} > #{remote_file.path.shellescape}`
    md5 = Digest::MD5.file(remote_file.path).hexdigest
    remote_file.original_filename = File.basename(remote_file.original_filename, File.extname(remote_file.original_filename)) + ".csv" 

    attachment = SupplierPrice.new(:attachment => remote_file, :md5 => md5)
    attachment.supplier = @job.supplier
    attachment.job_code = @job.job_code
    attachment.job_id = @job.id
    attachment.save

    retval << attachment.id

    remote_file.unlink
    
    self.optional = retval
    super

  end

end