class Habits
  def self.daily
    ["no alcohol","stretch","journal","meditate","visualize success","shower","am brush","pm brush"]
  end

  def self.create_todays_habits
    Habits.daily.each{|habit|
      Daily.create(date: Date.today, habit: habit, done: false)
    }
  end
end