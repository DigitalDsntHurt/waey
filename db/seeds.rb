require 'csv'


puts "#{Exercise.all.count} exercise records in db"

csv = CSV.read('lib/csvs/exercise_11feb2020.csv')[3..-25]
csv.each{|row|
  @hsh = {}
  @hsh[:date] = row[0].to_date
  if row[1] == nil or row[1] == "-"
    @hsh[:description] = nil
  else
    if row[1].include?("\n")
      if row[1][-1] == "\n" #and row[1][-2] == "\\"
        @hsh[:description] = row[1][0..-2].gsub("\n",", ")
      else
        @hsh[:description] = row[1].gsub("\n",", ")
      end
      
    else
      @hsh[:description] = row[1]
    end
  end
  @hsh[:total_minutes] = row[2].to_i
  Exercise.create(@hsh) 
}

puts "#{Exercise.all.count} exercise records in db"