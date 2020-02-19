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
end
