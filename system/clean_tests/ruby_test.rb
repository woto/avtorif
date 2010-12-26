#!/usr/bin/env ruby
#

require 'rubygems'
require 'fastercsv'


puts DateTime.now

FasterCSV.open("ruby_out.csv", "w") do |out|
  FasterCSV.foreach("in.csv", {:row_sep => "\r\n"}) do |row|
    out << row
  end
end

puts DateTime.now
