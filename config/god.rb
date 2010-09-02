God::Contacts::Email.defaults do |d|
  d.from_email = 'webmaster@avtorif.ru'
  d.from_name = 'webmaster'
  d.delivery_method = :smtp
  d.server_host = 'mail.avtorif.ru'
  d.server_port = 25
  d.server_user = 'webmaster'
  d.server_password = 'zBsnAbfhxY'
  d.server_auth = 'login'
  d.server_domain = 'avtorif.ru'

end

God.contact(:email) do |c|
  c.name = 'webmaster'
  c.group = 'developer'
  c.to_email = 'webmaster@avtorif.ru'
end

File.open('./zzz', 'w') do |f|
  f.write '1'
end

God.load "config/god/*.god"

