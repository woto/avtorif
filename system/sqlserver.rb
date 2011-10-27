require 'rubygems'
require 'tiny_tds'
require 'iconv'

client = TinyTds::Client.new(:username => 'server-price', :password => 'server-price', :dataserver => '192.168.1.6')

result = client.execute("SELECT TOP 2 * FROM [Price].[dbo].[PriceNalichie]")
result.each do |row|
  row.each do |column|
    column.each do |wtf|
      if wtf.is_a? String
        wtf = Iconv.iconv("UTF-8", "CP1251", wtf)
      end
      puts wtf
      #break
    end
  end
end
