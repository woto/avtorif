require 'net/ftp'

class FtpReceiver < AbstractReceiver
  def receive
    #puts @receiver
    ftp = Net::FTP.new
    ftp.connect(@receiver.server, @receiver.port)
    ftp.login(@receiver.login, @receiver.password)
    ftp.chdir(@receiver.path)

    files = ftp.list
    files = files.select { |file| file =~ Regexp.new(@receiver.receive_job.job.file_mask) }
    files.each do |file|
      file = file.split(/\s/)[-1]
      tmpfile = Tempfile.new(file)
      ftp.getbinaryfile(file, tmpfile.path)
      md5 = Digest::MD5.hexdigest(tmpfile.size.to_s)
      remote_file = RemoteFile.new(tmpfile.path)
      tmpfile.unlink
      attachment = Attachment.new(:price => remote_file, :price_file_name => file, :md5 => md5)
      #attachment.md5 = md5
      attachment.save

      #puts remote_file.original_filename #=> logo.gif
      #puts remote_file.content_type #= image/gif
      #unless File.exists? store_file_name
      #  FileUtils.mv(tmpfile.path, store_file_name)
      #end


      file

      @receiver.receive_job.job.childs.each do |child|
        JobWalker.new.start_job(child)
      end
    end

    ftp.close

  end
end