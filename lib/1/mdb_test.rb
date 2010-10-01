filename = '030910M.mdb'

a = `mdb-tables #{filename}`
a.split(' ').each do |table|
  puts `mdb-export #{filename} #{table} > #{table}.csv`
end

