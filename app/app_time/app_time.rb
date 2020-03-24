class AppTime

  def self.db_start_date
    Date.new(2020,1,1)
  end

  def self.full_db_daterange
    (db_start_date..Date.today)
  end

  def self.all_week_start_and_end_dates
    @week_start_dates_array = []

    @week_start = db_start_date
    until @week_start.monday?
      @week_start -= 1
    end

    @week_end = @week_start + 6

    @this_monday = Date.today
    until @this_monday.monday?
      @this_monday -= 1
    end
    
    until @week_start >= @this_monday + 7
      @week_start_dates_array << [@week_start,@week_end]
      @week_start += 7
      @week_end += 7
    end

    return @week_start_dates_array
  end

end