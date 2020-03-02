class ReviewController < ApplicationController
  def this_week
  end

  def last_week
    @journal = Daily.habit_metrics(Daily.filter_habit("journal",Daily.last_week))
    @journal_chart_data = @journal.map{|date,bool| bool ? 1 : -1 }

    @meditate = Daily.habit_metrics(Daily.filter_habit("meditate",Daily.last_week))
    @meditation_chart_data = @meditate.map{|date,bool| bool ? 1 : -1 }

    @visualize = Daily.habit_metrics(Daily.filter_habit("visualize success",Daily.last_week))
    @visualize_chart_data = @visualize.map{|date,bool| bool ? 1 : -1 }

    @consumption = Consumption.win_loss_days_and_percents(Consumption.last_week)

    @alcohol = Daily.habit_metrics(Daily.filter_habit("no alcohol",Daily.last_week))
    @alcohol_chart_data = @alcohol.map{|date,bool| bool ? 1 : -1 }

    @exercise = Exercise.review_totals
    @exercise_chart_data = Exercise.last_week_mins_per_day_chart_data

    @stretch = Daily.habit_metrics(Daily.filter_habit("stretch",Daily.last_week))

    @ambrush = Daily.habit_metrics(Daily.filter_habit("am brush",Daily.last_week))
    @ambrush_chart_data = @ambrush.map{|date,bool| bool ? 1 : -1 }

    @pmbrush = Daily.habit_metrics(Daily.filter_habit("pm brush",Daily.last_week))
    @pmbrush_chart_data = @pmbrush.map{|date,bool| bool ? 1 : -1 }
    
    @shower = Daily.habit_metrics(Daily.filter_habit("shower",Daily.last_week))
    @shower_chart_data = @shower.map{|date,bool| bool ? 1 : -1 }

    @sleep = Sleep.review_totals
    @sleep_chart_data = Sleep.last_week_hrs_per_night_chart_data

    @hrv = Hrv.review_totals
    @hrv_chart_data = Hrv.last_week_hrv_per_night_chart_data
  end

  def trailing_seven_days
  end

  def this_year_to_date
    @chart_data = Exercise.year_to_date_minutes_per_day

    @exercise = Exercise.review_totals
    @exercise_chart_data = Exercise.last_week_mins_per_day_chart_data
  end
end
