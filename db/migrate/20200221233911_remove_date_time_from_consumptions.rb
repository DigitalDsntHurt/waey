class RemoveDateTimeFromConsumptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :consumptions, :datetime
  end
end
