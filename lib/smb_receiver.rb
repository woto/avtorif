class SmbReceiver < AbstractReceiver
  def receive
    raise 'yepp'
    # TODO три часа просидел, так и не смог достучаться до самбы на русском )_(*&^%$#
    # smbclient //netgear/common/АЛЬФА/ -o username=office,password=2,iocharset=utf8,codepage=cp1251
    # а так работает 
    # smbclient //netgear/common/ -o username=office,password=2,iocharset=utf8,codepage=cp1251
  end
  #Code here
end