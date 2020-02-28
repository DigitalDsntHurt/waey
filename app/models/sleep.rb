class Sleep < ApplicationRecord
  validates :date, uniqueness: true
  validates :date, presence: true

  after_validation :calculate_total_hrs, :calculate_total_mins


  def self.create_todays_sleep
    Sleep.create(date: Date.today)
  end

  private

  def calculate_total_hrs
    self.total_hrs = hrs + (mins / 60.0).round(2) unless self.hrs == nil
  end

  def calculate_total_mins
    self.total_mins = (total_hrs * 60.0).round(2) unless self.total_hrs == nil
  end
end
