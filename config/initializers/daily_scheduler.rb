require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '1 0 * * *' do 
  Habits.daily.each{|habit|
    Daily.create(date: Date.today, habit: habit, done: false)
  }
end