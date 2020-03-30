class Sleep < ApplicationRecord
  validates :date, uniqueness: true
  validates :date, presence: true

  after_validation :calculate_total_hrs, :calculate_total_mins


  def self.create_todays_sleep
    Sleep.create(date: Date.today)
  end

  def self.last_week
    @week_start = Date.today
    unless @week_start.monday?
      until @week_start.monday?
        @week_start -= 1
      end
    end

    @week_end = @week_start + 6

    Sleep.all.where("date >= ? and date <= ?", (@week_start - 7), (@week_end - 7))
  end

  def self.review_totals
    {
      sleep_days: last_week.select{|record| record.total_hrs > 0 }.count,
      total_days: last_week.count,
      day_percent: (last_week.select{|record| record.total_hrs > 0 }.count / last_week.count.to_f * 100.0).round(2),
      avg_hrs_per_night: (last_week.pluck(:total_hrs).inject{|hrs, sum| hrs + sum } / last_week.count.to_f).round(2),
      avg_hrs_per_night_percent: ((last_week.pluck(:total_hrs).inject{|hrs, sum| hrs + sum } / last_week.count.to_f) / 7.0 * 100.0).round(2),
      total_hrs: last_week.pluck(:total_hrs).inject{|hrs, sum| hrs + sum}.round(2),
      total_hrs_percent: (last_week.pluck(:total_hrs).inject{|hrs, sum| hrs + sum} / 49 * 100.0).round(2)
    }
  end

  def self.last_week_hrs_per_night_chart_data
    last_week.pluck(:total_hrs)
  end

  def self.total_hrs(startdate,enddate)
    @total_hrs = Sleep.where('date >= ? and date <= ?', startdate, enddate).pluck(:total_hrs).inject{|hrs,sum| hrs + sum }
    
    if @total_hrs == nil
      return 0
    else
      return @total_hrs.round(2)
    end
  end
  
  def self.hrs_per_day(startdate,enddate)
    Sleep.where('date >= ? and date <= ?', startdate, enddate).map{|record| [record.date, record.total_hrs] }
  end

  private

  def calculate_total_hrs
    self.total_hrs = hrs + (mins / 60.0).round(2) unless self.hrs == nil
  end

  def calculate_total_mins
    self.total_mins = (total_hrs * 60.0).round(2) unless self.total_hrs == nil
  end

  def self.sleep_review_stats(startdate,enddate)
    @query = Sleep.where('date >= ? and date <= ?', startdate, enddate)

    @hsh = {}
    @hsh[:avg_hrs_per_night] = (@query.pluck(:total_hrs).inject{|hrs,sum| hrs + sum } / @query.count).round(2)

    return @hsh
  end


end
