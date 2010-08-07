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
      #ftp.close
      md5 = Digest::MD5.hexdigest(tmpfile.size.to_s)
      store_file_name = '.' + AppConfig.price_path + md5
      unless File.exists? store_file_name
        FileUtils.mv(tmpfile.path, store_file_name)
      end
      tmpfile.unlink

      JobWalker.new.start_job(@receiver.receive_job.job.child)
    end
  end
end