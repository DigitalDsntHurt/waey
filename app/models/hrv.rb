class Hrv < ApplicationRecord

  validates :date, uniqueness: true
  validates :date, presence: true

  def self.create_todays_hrv
    Hrv.create(date: Date.today)
  end

end
