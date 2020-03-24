class Habits
  def self.daily
    ["no alcohol","stretch","journal","meditate","visualize success","shower","am brush","pm brush"]
  end

  def self.create_todays_habits
    Habits.daily.each{|habit|
      Daily.create(date: Date.today, habit: habit, done: false)
    }
    Exercise.create_todays_exercise
    Sleep.create_todays_sleep
    Hrv.create_todays_hrv
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

  def self.check_missing_habits
    @payload = []
    
    Habits.daily.each{|habit|
      @missing_dates_hsh = {}
      # @daterange = (AppTime.db_start_date..Date.today)
      @arr = []
      AppTime.full_db_daterange.each{|date|
        if Daily.where(habit: habit).where(date: date).count < 1
          @arr << date
        end
      }
      @missing_dates_hsh[habit] = @arr
      @payload << @missing_dates_hsh
    }
    
    return @payload
  end

  def self.check_missing_exercise_days
    @dates = [] 
    AppTime.full_db_daterange.each{|date|
      if Exercise.where(date: date).count < 1
        @dates << date
      end
    }

    return @dates
  end

  def self.check_missing_consumption_days
    @dates = []
    AppTime.full_db_daterange.each{|date|
      if Consumption.where(date: date).count < 1
        @dates << date
      end
    }

    return @dates
  end

  def self.create_outstanding_habits
    ## Dailies
    check_missing_habits.each{|hsh|
      hsh.each{|habit,dates|
        dates.each{|date|
          Daily.create(date: date, habit: habit, done: false)
        }
      }
    }

    ## Exercise
    check_missing_exercise_days.each{|date|
      Exercise.create(date: date, description: "--", total_minutes: 0)
    }

    ## Consumption
    check_missing_consumption_days.each{|date|
      Consumption.create(date: date, description: "untracked", feeling_score: 0, win: false)
    }
  end
end