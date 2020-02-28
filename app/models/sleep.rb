class Sleep < ApplicationRecord
  validates :date, uniqueness: true
  validates :date, presence: true

  after_validation :calculate_total_hrs, :calculate_total_mins

  private

  def calculate_total_hrs
    self.total_hrs = hrs + (mins / 60.0).round(2)
  end

  def calculate_total_mins
    self.total_mins = (total_hrs * 60.0).round(2)
  end
end
