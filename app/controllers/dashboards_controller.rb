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
    @daily_exercise_mins_goal = 60
    @today_exercise_mins_complete = Exercise.minutes_today
    @today_exercise_mins_incomplete = @daily_exercise_mins_goal - @today_exercise_mins_complete
    @percent_complete = (@today_exercise_mins_complete / 60.0).round(2) * 100
    @percent_incomplete = 100 - @percent_complete
    #@exercise_payload = {mins_bar_val: @exercise_mins_today[0], mins_to_go_bar_val: (@exercise_mins_today[1] - @exercise_mins_today[0]), mins_percent_val: (@exercise_mins_today[0]/@exercise_mins_today[1]*100.0).round, mins_percent_to_go_bar_val: (100-(@exercise_mins_today[0]/@exercise_mins_today[1]*100.0).round) }
  end
end