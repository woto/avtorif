# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Currency.create(:title => "Рубль", :foreign_id => 643, :value => 1)
euro = Currency.create(:title => "€", :foreign_id => 978, :value => 1)
dollar = Currency.create(:title => "$", :foreign_id => 840, :value => 1)
Currency.create(:title => "$+1%", :foreign_id => 'DAA', :value => 1)
Currency.create(:title => "$+1,5%", :foreign_id => 'DAA', :value => 1, :parent => dollar, :percent => 1)
Currency.create(:title => "€+1,5%", :foreign_id => 'EAA', :value => 1, :parent => euro, :percent => 1)
