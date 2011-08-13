class UnpackJobable < AbstractJobber
  def perform
    #unpack_class = (@jobable.receiveable.type.to_s.split(/Receive/).first + "Receiver").classify.constantize
    #receiver = receiver_class.new(@job, @jobable, @jobable.receiveable, @optional)
    #self.optional = receiver.receive
    retval = Array.new()
    group_code = 'u' + @optional.to_s + Time.now.to_s
    @optional.each do |opt|
      supplier_price = SupplierPrice.find(opt).attachment
      
      Dir.mktmpdir do |tempdir|

        case `file --mime #{supplier_price.path.shellescape}`
          when /zip/
            `unzip "#{supplier_price.path}" -d #{tempdir}`
          when /rar/
            `unrar e "#{supplier_price.path}" #{tempdir}`
        end

        Dir["#{tempdir}/*"].each do |file|
          remote_file = File.new(file)

          remote_file.instance_eval("
            def original_filename()
                \"#{File.basename(supplier_price.original_filename) + " - " + File.basename(remote_file.path)}\"
            end

            def content_type()
              mime = `file --mime -br #{remote_file.path.shellescape.shellescape}`.strip
              mime = mime.gsub(/^.*: */,\"\")
              mime = mime.gsub(/;.*$/,\"\")
              mime = mime.gsub(/,.*$/,\"\")
              mime
            end
          ")

          md5 = Digest::MD5.file(file).hexdigest
          wc_stat = `wc #{file.shellescape}`

          #if SupplierPrice.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @job.supplier.id]).nil?
            attachment = SupplierPrice.new(:group_code => group_code, :attachment => remote_file, :md5 => md5, :wc_stat => wc_stat)
            attachment.supplier = @job.supplier
            attachment.job_code = @job.title
            attachment.job_id = @job.id
            attachment.save

            retval << attachment.id

            #@receiver.receive_job.job.childs.each do |child|
            #  JobWalker.new.start_job(child, attachment.id)
            #end

          #end

          #File.unlink remote_file.path
          
        end

      end

    end

    @optional = retval
    super    
  
  end

end
