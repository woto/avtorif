# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
manufacturer = Manufacturer.create(:name => 'Toyota')
contractor = Contractor.create(:name => "Афганистан")
price = Price.create(:contractor => contractor, :margin => 2.3, :code => 'M0000001')
good = Good.create(:price => price, :cost => 1500.57, :code => '909L20-0AX18', :contractor => contractor)
  
