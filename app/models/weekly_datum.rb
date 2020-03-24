class WeeklyDatum < ApplicationRecord
  validates :week_of, uniqueness: true
  validates :week_of, presence: true


  def self.update_totals
    AppTime.all_week_start_and_end_dates.each{|startdate,enddate|
      if WeeklyDatum.where(week_of: startdate).exists?
        WeeklyDatum.update(week_of: startdate, meditation_days: Daily.completed_habits("meditate",startdate,enddate), journal_days: Daily.completed_habits("journal",startdate,enddate), winning_consumption_days: Consumption.winning_days(startdate,enddate), no_alcohol_days: Daily.completed_habits("no alcohol",startdate,enddate), exercise_days: Exercise.exercise_days(startdate,enddate), total_sleep_hours: Sleep.total_hrs(startdate,enddate), shower_days: Daily.completed_habits("shower",startdate,enddate), am_brush_days: Daily.completed_habits("am brush",startdate,enddate), pm_brush_days: Daily.completed_habits("pm brush",startdate,enddate))
      else
        WeeklyDatum.create(week_of: startdate, meditation_days: Daily.completed_habits("meditate",startdate,enddate), journal_days: Daily.completed_habits("journal",startdate,enddate), winning_consumption_days: Consumption.winning_days(startdate,enddate), no_alcohol_days: Daily.completed_habits("no alcohol",startdate,enddate), exercise_days: Exercise.exercise_days(startdate,enddate), total_sleep_hours: Sleep.total_hrs(startdate,enddate), shower_days: Daily.completed_habits("shower",startdate,enddate), am_brush_days: Daily.completed_habits("am brush",startdate,enddate), pm_brush_days: Daily.completed_habits("pm brush",startdate,enddate))
      end
    }
  end
end
