# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Manufacturer.create(:name => 'Opel')
manufacturer = Manufacturer.create(:name => 'Toyota')
contractor1 = Contractor.create(:name => "ника")
contractor2 = Contractor.create(:name => "ПЕЛИКАН-АВТО")

#Price.create(:contractor => contractor, :margin => 2.3, :code => 'M0000001', :original => true)
#price = Price.create(:contractor => contractor, :margin => 5.7, :code => 'M0000003', :original => false)

#Goods.create(:price => price, :cost => 100.20, :code => '907L200A', :contractor => contractor, :manufacturer => manufacturer)
#goods = Goods.create(:price => price, :cost => 1500.57, :code => '909L20-0AX18', :contractor => contractor, :manufacturer => manufacturer)

#EmailSetting.create(:email => 'fake@example.com', :pop => 'fake.example.com').create_price(:code => 'EXAMPLE-00201', :contractor => contractor, :margin => 8.37, :original => true, :username => 'username1', :password => 'password1')
#FtpSetting.create(:ftp => 'ftp://example.com').create_price(:code => 'EXAMPLE-04301', :contractor => contractor, :margin => 9.78, :original => false, :username => 'username2', :password => 'password2')
#FolderSetting.create(:path => '\\127.0.0.1\какой-то_путь\папка-для-прайсов').create_price(:code => 'EXAMPLE-00022', :contractor => contractor, :margin => 1.98, :original => true, :username => 'username3', :password => 'password3')

FtpSetting.create(:ftp => 'ftp://avtorif.ru').create_price(:filename => 'LucJC.xls', :name => 'аксесуары', :code=> 'REAL-0001200-FAKE', :contractor => contractor1, :margin => 9.78, :original => false, :username => 'lucid', :password => 'Kl32r5x0')
dFtpSetting.create(:ftp => 'ftp://avtorif.ru').create_price(:filename => 'PEL.xls', :name => 'НАЛИЧИЕ', :code=> 'REAL-0001200-FAKE', :contractor => contractor2, :margin => 9.78, :original => false, :username => 'pelikan', :password => 'lcaz6Ksf8')