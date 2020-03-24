class AppTime

  def self.db_start_date
    Date.new(2020,1,1)
  end

  def self.full_db_daterange
    (db_start_date..Date.today)
  end

end