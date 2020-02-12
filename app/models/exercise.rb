class Exercise < ApplicationRecord

  def self.daily_minutes
    Exercise.all.map{|day| [day.date, day.total_minutes] }.to_json
  end

end
