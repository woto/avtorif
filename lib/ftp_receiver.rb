class FtpReceiver < AbstractReceiver
  def receive
    #puts @receiver
    ftp = Net::FTP.new
    ftp.connect(@receiver.server)
    ftp.path = @receiver.path
    ftp.login(@receiver.login, @receiver.password)
    ftp.chdir(@receiver.path)
  
    files = ftp.list
    files = files.select { |file| file =~ file_mask }
    # TODO 1
    if files.count > 1
      raise Exception 'Found more than one file, specify more precisely mask'
    end
    file = files[0].split(/\s/)[-1]
    tmpfile = Tempfile.new(file)
    @ftp.getbinaryfile(file, tmpfile)
    @ftp.close
    md5 = Digest::MD5.hexdigest(tmpfile)
    FileUtils.mv(tmpfile, Appconfig.price_path + md5)
  end
end
