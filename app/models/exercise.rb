class Exercise < ApplicationRecord

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

end
