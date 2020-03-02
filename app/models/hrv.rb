class Hrv < ApplicationRecord

  validates :date, uniqueness: true
  validates :date, presence: true

  def self.create_todays_hrv
    Hrv.create(date: Date.today)
  end

  def self.last_week
    @week_start = Date.today
    unless @week_start.monday?
      until @week_start.monday?
        @week_start -= 1
      end
    end

    @week_end = @week_start + 6

    Hrv.all.where("date >= ? and date <= ?", (@week_start - 7), (@week_end - 7))
  end

  def self.review_totals
    {
      avg_hrv_per_night: (last_week.pluck(:hrv).inject{|hrv, sum| hrv + sum } / last_week.count.to_f).round(2)
    }
  end

  def self.last_week_hrv_per_night_chart_data
    last_week.pluck(:hrv)
  end

end
