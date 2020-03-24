require 'csv'



## BEGIN testing -- to delete ##


## END testing -- to delete ##

##
## ##
## ## #
## ##
##
## ##
## ## ##
## ## ## ## ## > BEGIN ~ weekly data table -- initial, one-time seed
## ## ##
## ##
##
## ##
## ## #
## ##
##

# AppTime.all_week_start_and_end_dates.each{|startdate,enddate|
#   puts "~== #{startdate} ==~"
#   p Sleep.total_hrs(startdate,enddate)
#   puts "\n\n= = =\n\n"
# }

AppTime.all_week_start_and_end_dates.each{|startdate,enddate|
  WeeklyDatum.create(week_of: startdate, meditation_days: Daily.completed_habits("meditate",startdate,enddate), journal_days: Daily.completed_habits("journal",startdate,enddate), winning_consumption_days: Consumption.winning_days(startdate,enddate), no_alcohol_days: Daily.completed_habits("no alcohol",startdate,enddate), exercise_days: Exercise.exercise_days(startdate,enddate), total_sleep_hours: Sleep.total_hrs(startdate,enddate), shower_days: Daily.completed_habits("shower",startdate,enddate), am_brush_days: Daily.completed_habits("am brush",startdate,enddate), pm_brush_days: Daily.completed_habits("pm brush",startdate,enddate))
}

##
## ##
## ## #
## ##
##
## ##
## ## ##
## ## ## ## ## > BEGIN ~ weekly data table -- initial, one-time seed
## ## ##
## ##
##
## ##
## ## #
## ##
##


#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################
#################################################################################################################################################################################

##
## ##
## ## #
## ##
##
## ##
## ## ##
## ## ## ## ## > BEGIN ~ daily habits seeding from google sheets csv exports
## ## ##
## ##
##
## ##
## ## #
## ##
##

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

# #
# ## ##
# ## ## ## Seed alcohol from csv export from google sheets tracking here: https://docs.google.com/spreadsheets/d/1h4cshbbBafRe5qW2HWs-PD8vUNVzRsejBAv1eYTVqbc/edit#gid=1575872839
# ## ##
# ##
# puts "#{Daily.where(habit: "no alcohol").count} alcohol records in daily habits model"

# csv = CSV.read('lib/csvs/alcohol.csv').to_a
# @tmp = []
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "no alcohol"
#   @hsh[:done] = row[1] 

#   @tmp << @hsh
# }

# @dates = []
# @tmp.each{|hsh|
#   @dates << hsh[:date]
# }

# @dates.uniq.each{|date|
#   @daily_true_false = @tmp.select{|hsh| hsh[:date] == date }.map{|hsh| hsh[:done] }
#   if @daily_true_false.include?("FALSE")
#     @hsh = {date: date, habit: "no alcohol", done: false }
#     p @hsh
#     Daily.create(@hsh)
#   else
#     @hsh = {date: date, habit: "no alcohol", done: true }
#     p @hsh
#     Daily.create(@hsh)
#   end
# }

# puts "#{Daily.where(habit: "no alcohol").count} alcohol records in daily habits model"

# #
# ## ##
# ## ## ## Seed am brush from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "am brush").count} am brush records in daily habits model"

# csv = CSV.read('lib/csvs/ambrush.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "am brush"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "am brush").count} am brush records in daily habits model"

# #
# ## ##
# ## ## ## Seed pm brush from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "pm brush").count} pm brush records in daily habits model"

# csv = CSV.read('lib/csvs/pmbrush.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "pm brush"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "pm brush").count} pm brush records in daily habits model"

# #
# ## ##
# ## ## ## Seed showers from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "shower").count} shower records in daily habits model"

# csv = CSV.read('lib/csvs/shower.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "shower"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "shower").count} shower records in daily habits model"

# #
# ## ##
# ## ## ## Seed visualize from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "visualize success").count} visualization records in daily habits model"

# csv = CSV.read('lib/csvs/visualize.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "visualize success"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "visualize success").count} visualization records in daily habits model"

# #
# ## ##
# ## ## ## Seed meditation from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "meditate").count} meditation records in daily habits model"

# csv = CSV.read('lib/csvs/meditate.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "meditate"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "meditate").count} meditation records in daily habits model"

# #
# ## ##
# ## ## ## Seed journal from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "journal").count} journal records in daily habits model"

# csv = CSV.read('lib/csvs/journal.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "journal"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "journal").count} journal records in daily habits model"

# #
# ## ##
# ## ## ## Seed stretch from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Daily.all.where(habit: "stretch").count} stretch records in daily habits model"

# csv = CSV.read('lib/csvs/stretch.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:habit] = "stretch"
#   @hsh[:done] = row[1]
  
#   Daily.create(@hsh) 
# }

# puts "#{Daily.all.where(habit: "stretch").count} stretch records in daily habits model"




# #
# ## ##
# ## ## ## Seed sleep from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Sleep.all.count} sleep records in sleep model"

# csv = CSV.read('lib/csvs/sleep.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:hrs] = row[1]
#   @hsh[:mins] = row[2]
  
#   Sleep.create(@hsh) 
# }

# puts "#{Sleep.all.count} sleep records in sleep model"



# #
# ## ##
# ## ## ## Seed hrv from csv export from google sheets tracking 
# ## ##
# ##
# puts "#{Hrv.all.count} hrv records in hrv model"

# csv = CSV.read('lib/csvs/hrv.csv').to_a
# csv[1..-1].each{|row|
#   @hsh = {}
#   @hsh[:date] = row[0].to_date
#   @hsh[:hrv] = row[1]
  
#   Hrv.create(@hsh)
# }

# puts "#{Hrv.all.count} hrv records in hrv model"

##
## ##
## ## #
## ##
##
## ##
## ## ##
## ## ## ## ## > END ~ daily habits seeding from google sheets csv exports
## ## ##
## ##
##
## ##
## ## #
## ##
##