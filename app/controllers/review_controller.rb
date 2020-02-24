class ReviewController < ApplicationController
  def this_week
  end

  def last_week
    @consumption = Consumption.win_loss_days_and_percents(Consumption.last_week)
    @alcohol = Daily.habit_metrics(Daily.filter_habit("no alcohol",Daily.last_week))

    @journal = Daily.habit_metrics(Daily.filter_habit("journal",Daily.last_week))
    @meditate = Daily.habit_metrics(Daily.filter_habit("meditate",Daily.last_week))

    @ambrush = Daily.habit_metrics(Daily.filter_habit("am brush",Daily.last_week))
    @pmbrush = Daily.habit_metrics(Daily.filter_habit("pm brush",Daily.last_week))
    @shower = Daily.habit_metrics(Daily.filter_habit("shower",Daily.last_week))
  end

  def trailing_seven_days
  end
end
