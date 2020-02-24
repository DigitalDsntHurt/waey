class DashboardsController < ApplicationController
  def scratch
    @exercise_days = Exercise.daily_minutes.map{|arr| arr[1] }.map{|i|
      if i == 0
        1
      else
        i
      end
    }
  end

  def exercise
    @exercise_days = Exercise.daily_minutes

    respond_to do |format|
      format.html
      format.json { render json: @votes }
    end
  end

  def consumption
  end

  def daily_habits
  end

  def sleep
    @exercise_days = Exercise.daily_minutes.map{|arr| arr[1] }.map{|i|
      if i == 0
        1
      else
        i
      end
    }

    @dates_and_minutes = Exercise.daily_minutes
  end

  def today
    Habits.create_todays_habits

    @daily_exercise_mins_goal = 60
    @today_exercise_mins_complete = Exercise.minutes_today
    @today_exercise_mins_incomplete = @daily_exercise_mins_goal - @today_exercise_mins_complete
    @percent_complete = (@today_exercise_mins_complete / 60.0).round(2) * 100
    @percent_incomplete = 100 - @percent_complete


    @todays_ambrush = Daily.where(date: Date.today).where(habit: "am brush")[0]
    @todays_pmbrush = Daily.where(date: Date.today).where(habit: "pm brush")[0]
    @todays_shower = Daily.where(date: Date.today).where(habit: "shower")[0]
    @todays_alcohol = Daily.where(date: Date.today).where(habit: "no alcohol")[0]
    @todays_meditation = Daily.where(date: Date.today).where(habit: "meditate")[0]
    @todays_journal = Daily.where(date: Date.today).where(habit: "journal")[0]
    @todays_visualization = Daily.where(date: Date.today).where(habit: "visualize success")[0]
    @todays_stretch = Daily.where(date: Date.today).where(habit: "stretch")[0]
  end
end