class Exercise < ApplicationRecord

  validates :date, uniqueness: true
  validates :date, presence: true
  validates :description, presence: true
  validates :total_minutes, presence: true

  def self.create_todays_exercise
    Exercise.create(date: Date.today, description: "--", total_minutes: 0)
  end

  def self.daily_minutes
    Exercise.all.map{|day| [day.date, day.total_minutes] }
  end

  def self.minutes_today
    @payload = Exercise.where(date: Date.today).pluck(:total_minutes)
    if @payload.length == 0
      return 0
    elsif @payload.length == 1
      return @payload[0]
    else
      return @payload.inject{|mins,sum| mins + sum }
    end
  end

  def self.last_week
    @week_start = Date.today
    unless @week_start.monday?
      until @week_start.monday?
        @week_start -= 1
      end
    end

    @week_end = @week_start + 6

    Exercise.all.where("date >= ? and date <= ?", (@week_start - 7), (@week_end - 7))
  end

  def self.review_totals
    {
      exercise_days: last_week.select{|record| record.total_minutes > 0 }.count, 
      total_days: last_week.count, 
      day_percent: (last_week.select{|record| record.total_minutes > 0 }.count / last_week.count.to_f * 100.0).round(2), 
      avg_mins_per_day: (last_week.pluck(:total_minutes).inject{|min, sum| min + sum } / last_week.count.to_f).round(2),
      avg_mins_per_day_percent: ((last_week.pluck(:total_minutes).inject{|min, sum| min + sum } / last_week.count.to_f) / 60.0 * 100.0).round(2),
      total_minutes: last_week.pluck(:total_minutes).inject{|min, sum| min + sum},
      total_minutes_percent: (last_week.pluck(:total_minutes).inject{|min, sum| min + sum} / 420.0 * 100.0).round(2)
    }  
  end

  def self.last_week_mins_per_day_chart_data
    last_week.pluck(:total_minutes)
  end

end
