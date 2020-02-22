class AddDateToConsumption < ActiveRecord::Migration[6.0]
  def change
    add_column :consumptions, :date, :date
  end
end
