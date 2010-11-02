class UnpackJobable < AbstractJobber
  def perform
    #unpack_class = (@jobable.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    #receiver = receiver_class.new(@job, @jobable, @jobable.receiveable, @optional)
    #self.optional = receiver.receive
    retval = Array.new()
    supplier_price = SupplierPrice.find(@optional).attachment
    
    Dir.mktmpdir do |tempdir|

      case `file --mime #{supplier_price.path}`
        when /zip/
          `unzip #{supplier_price.path} -d #{tempdir}`
        when /rar/
          raise "write right shell command for rar archives"
      end

      Dir["#{tempdir}/*"].each do |file|
        remote_file = File.new(file)

        remote_file.instance_eval("
          def original_filename()
              \"#{File.basename(remote_file.path)}\"
          end

          def content_type()
            mime = `file --mime -br #{remote_file.path}`.strip
            mime = mime.gsub(/^.*: */,\"\")
            mime = mime.gsub(/;.*$/,\"\")
            mime = mime.gsub(/,.*$/,\"\")
            mime
          end
        ")

        md5 = Digest::MD5.file(file).hexdigest

        #if SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
          attachment = SupplierPrice.new(:attachment => remote_file, :md5 => md5)
          attachment.supplier = @job.supplier
          attachment.job_code = @job.job_code
          attachment.job_id = @job.id
          attachment.save

          retval << attachment.id

          #@receiver.receive_job.job.childs.each do |child|
          #  JobWalker.new.start_job(child, attachment.id)
          #end

        #end

      end

    end
    
    self.optional = retval
    super    
  
  end

end