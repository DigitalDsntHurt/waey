module ApplicationHelper
  
  def create_outstanding_habits
    Habits.create_outstanding_habits if MOST_RECENT_DAILY_CREATE_DATE < TODAY
  end  
end
