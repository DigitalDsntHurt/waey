class ReviewController < ApplicationController
  def this_week
  end

  def last_week
    @journal = Daily.habit_metrics(Daily.filter_habit("journal",Daily.last_week))
    @meditate = Daily.habit_metrics(Daily.filter_habit("meditate",Daily.last_week))
    @visualize = Daily.habit_metrics(Daily.filter_habit("visualize success",Daily.last_week))

    @consumption = Consumption.win_loss_days_and_percents(Consumption.last_week)
    @alcohol = Daily.habit_metrics(Daily.filter_habit("no alcohol",Daily.last_week))

    @exercise = Exercise.review_totals
    @exercise_chart_data = Exercise.last_week_mins_per_day_chart_data

    @stretch = Daily.habit_metrics(Daily.filter_habit("stretch",Daily.last_week))

    @ambrush = Daily.habit_metrics(Daily.filter_habit("am brush",Daily.last_week))
    @ambrush_chart_data = @ambrush.map{|date,bool| bool == true ? 1 : -1 }

    @pmbrush = Daily.habit_metrics(Daily.filter_habit("pm brush",Daily.last_week))
    @pmbrush_chart_data = @pmbrush.map{|date,bool| bool == true ? 1 : -1 }
    
    @shower = Daily.habit_metrics(Daily.filter_habit("shower",Daily.last_week))
  end

  def trailing_seven_days
  end

  def this_year_to_date
    @chart_data = Exercise.year_to_date_minutes_per_day

    @exercise = Exercise.review_totals
    @exercise_chart_data = Exercise.last_week_mins_per_day_chart_data
  end
end
