require 'net/ftp'

class FtpReceiver < AbstractReceiver
  def receive
    Timeout.timeout(1000) do

      #puts @receiver
      ftp = Net::FTP.new
      ftp.debug_mode = true
      ftp.connect(@receiver.server, @receiver.port)
      ftp.passive = true
      ftp.login(@receiver.login, @receiver.password)
      ftp.chdir(@receiver.path)

      files = ftp.list
      files = files.select { |file| file =~ Regexp.new(@receiver.receive_job.job.file_mask) }
      files.each do |file|
        file = file.split(/\s/)[-1]
        tmpfile = Tempfile.new(file)
        ftp.getbinaryfile(file, tmpfile.path)
        md5 = Digest::MD5.hexdigest(File.read(tmpfile.path))
        remote_file = RemoteFile.new(tmpfile.path)
        tmpfile.unlink
        remote_file.original_filename = file
        attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
        #attachment.attachment_file_name = file
        #puts remote_file.original_filename #=> logo.gif
        #attachment.md5 = md5
        attachment.supplier = @receiver.receive_job.job.supplier
        begin
          attachment.save
        rescue ActiveRecord::StatementInvalid => e
          raise 'Ошибка вставки прайса в таблицу в процессе приема с фтп' unless e.message =~ /Duplicate entry/
          break
        end

        #puts remote_file.content_type #= image/gif
        #unless File.exists? store_file_name
        #  FileUtils.mv(tmpfile.path, store_file_name)
        #end


        #file

        @receiver.receive_job.job.childs.each do |child|
          JobWalker.new.start_job(child)
        end
      end

      ftp.close

    end
  end
end