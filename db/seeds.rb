require 'csv'

# ##
# ## ##
# ## ## ## Seed exercise from csv export from google sheets tracking here: https://docs.google.com/spreadsheets/d/1h4cshbbBafRe5qW2HWs-PD8vUNVzRsejBAv1eYTVqbc/edit#gid=304457514
# ## ##
# ##
# puts "#{Exercise.all.count} exercise records in db"

# csv = CSV.read('lib/csvs/exercise.csv').to_a
# csv.each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   if row[1] == nil or row[1] == "-" or row[1].include?("/exercises/")
#     @hsh[:description] = ""
#   else
#     if row[1].include?("\n")
#       if row[1][-1] == "\n" #and row[1][-2] == "\\"
#         @hsh[:description] = row[1][0..-2].gsub("\n",", ")
#       else
#         @hsh[:description] = row[1].gsub("\n",", ")
#       end
      
#     else
#       @hsh[:description] = row[1]
#     end
#   end
#   @hsh[:total_minutes] = row[2].to_i
#   Exercise.create(@hsh) 
# }

# puts "#{Exercise.all.count} exercise records in db"


# #
# ## ##
# ## ## ## Seed consumption from csv export from google sheets tracking here: https://docs.google.com/spreadsheets/d/1h4cshbbBafRe5qW2HWs-PD8vUNVzRsejBAv1eYTVqbc/edit#gid=1575872839
# ## ##
# ##
# puts "#{Consumption.all.count} consumption records in db"

# csv = CSV.read('lib/csvs/consumption.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:description] = row[2]
#   @hsh[:feeling_score] = row[3].to_i
#   @hsh[:win] = row[4]
  
#   Consumption.create(@hsh) 
# }

# puts "#{Consumption.all.count} consumption records in db"


# ##
# ## ## clean up blank descriptions in consumption
# ##

# Consumption.all.each{|consumption|
#   if consumption.description == nil
#     # p  consumption
#     consumption.update(description: "")#.save
#   end
# }
