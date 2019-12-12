require 'csv'

CSV.foreach ('liste.csv') do |row|
  puts row.inspect
end
