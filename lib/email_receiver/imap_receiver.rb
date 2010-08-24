#require 'mail'
require 'net/pop'
require 'tlsmail'
require 'net/imap'


class ImapReceiver

end

=begin
class EmailReceiver < AbstractReceiver

  def extract_attachments parts, msgID
    if parts.media_type == "MULTIPART"
      parts.parts.each_with_index do |part, subindex|
        @subindex = subindex
        extract_attachments part, msgID
      end
    elsif parts.media_type == "TEXT"
      return
    elsif parts.media_type == "IMAGE"
      return
    elsif parts.media_type == "APPLICATION"
      cType = parts.media_type
      cName = parts.param['NAME']
      #attachment = imap.fetch(msgID, "BODY[#{i}]")[0].attr["BODY[#{i}]"]
      remote_file = RemoteFile.new(cName)
      remote_file << @imap.fetch(msgID, "BODY[#{@index}]")[0].attr["BODY[#{@subindex}]"].unpack('m')
      #remote_file << parts.unpack('m')
      md5 =   Digest::MD5.hexdigest(File.read(remote_file.path))
      attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
      attachment.save

#
#      if Attachment.find(:first, :conditions => ['md5 = ? AND supplier_id = ?',  md5, @receiver.receive_job.job.supplier.id]).nil?
#
#        attachment = Attachment.new(:attachment => remote_file, :md5 => md5)
#        attachment.supplier = @receiver.receive_job.job.supplier
#        attachment.save
#
#        @receiver.receive_job.job.childs.each do |child|
#          JobWalker.new.start_job(child, attachment.id)
#        end
#
#      end
#
#      remote_file.unlink
#
#      #File.new(cName,'wb+').write(attachment.unpack('m'))
#    end
#  end
#
#  else
#    i = 0
#  end

    end
  end

  def receive

    @imap = Net::IMAP.new(@receiver.server, @receiver.port, @receiver.ssl?)

    @imap.login(@receiver.login, @receiver.password)
    @imap.select('Inbox')

    # All msgs in a folder
    msgs = @imap.search(["SINCE", "1-Jan-1969"])
    # Read each message
    msgs.each do |msgID|
      puts msgID
#
#      msg = @imap.fetch(msgID, ["ENVELOPE","UID","BODY"] )[0]
#    # Only those with 'SOMETEXT' in subject are of our interest
#      #if msg.attr["ENVELOPE"].subject.index('SOMETEXT') != nil
#      body = msg.attr["BODY"]
#      i = 0
#      if(!body.is_a?(Net::IMAP::BodyTypeText) )
#        body.parts.each_with_index do |part, index|
#          @index = index
#          extract_attachments part, msgID
#        end
#      end

    end
    @imap.close
  end
end

=end