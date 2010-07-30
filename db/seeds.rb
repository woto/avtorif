# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
#Manufacturer.create(:name => 'Opel')
#manufacturer = Manufacturer.create(:name => 'Toyota')

#PriceReceive.create(:contractor => contractor, :margin => 2.3, :code => 'M0000001', :original => true)
#price = PriceReceive.create(:contractor => contractor, :margin => 5.7, :code => 'M0000003', :original => false)

#Goods.create(:price => price, :cost => 100.20, :code => '907L200A', :contractor => contractor, :manufacturer => manufacturer)
#goods = Goods.create(:price => price, :cost => 1500.57, :code => '909L20-0AX18', :contractor => contractor, :manufacturer => manufacturer)

#EmailSetting.create(:email => 'fake@example.com', :pop => 'fake.example.com').create_price(:code => 'EXAMPLE-00201', :contractor => contractor, :margin => 8.37, :original => true, :username => 'username1', :password => 'password1')
#FtpReceiveSetting.create(:ftp => 'ftp://example.com').create_price(:code => 'EXAMPLE-04301', :contractor => contractor, :margin => 9.78, :original => false, :username => 'username2', :password => 'password2')
#FolderReceiveSetting.create(:path => '\\127.0.0.1\какой-то_путь\папка-для-прайсов').create_price(:code => 'EXAMPLE-00022', :contractor => contractor, :margin => 1.98, :original => true, :username => 'username3', :password => 'password3')

Repeat.create(:cron_string => "*/1 * * * *", :title => "Каждую минуту")
Repeat.create(:cron_string => "0 23 * * *", :title => "Каждый день в 23:00")
Repeat.create(:cron_string => "*/10 * * * *", :title => "Каждые 10 минут")


supplier1 = Supplier.create(:name => "ника")
supplier2 = Supplier.create(:name => "ПЕЛИКАН-АВТО")

Ftp.create(
  :server => 'ftp://avtorif.ru',
  :path => '',
  :login => 'lucid',
  :password => 'Kl32r5x0'
).prices.create(
  :file_mask => 'LucJC.xls',
  :title => 'аксесуары',
  :code=> 'REAL-0001200-FAKE',
  :supplier => supplier1
)

Ftp.create(
  :server => 'ftp://avtorif.ru',
  :path => '',
  :login => 'pelikan',
  :password => 'lcaz6Ksf8'
).prices.create(
  :file_mask => 'PEL.xls',
  :title => 'НАЛИЧИЕ',
  :code => 'REAL-0001201-FAKE',
  :supplier => supplier1
)