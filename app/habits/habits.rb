class Habits
  def self.daily
    ["no alcohol","stretch","journal","meditate","visualize success","shower","am brush","pm brush"]
  end

  def self.check_most_recent_habit_date
    @hsh = {}
    Habits.daily.each{|habit|
      @hsh[habit.gsub(" ","_").to_sym] = Daily.where(habit: habit).order(:date).last.date
    }
      @hsh[:exercise] = Exercise.all.last.date
      @hsh[:sleep] = Sleep.all.last.date
      @hsh[:hrv] = Hrv.all.last.date
    
    return @hsh
  end

  def self.create_todays_habits
    Habits.daily.each{|habit|
      Daily.create(date: Date.today, habit: habit, done: false)
    }
    Exercise.create_todays_exercise
    Sleep.create_todays_sleep
    Hrv.create_todays_hrv
  end
end