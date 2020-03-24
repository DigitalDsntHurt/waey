class CreateWeeklyData < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_data do |t|
      t.date :week_of
      t.integer :meditation_days
      t.integer :journal_days
      t.integer :winning_consumption_days
      t.integer :no_alcohol_days
      t.integer :exercise_days
      t.float :total_sleep_hours
      t.integer :shower_days
      t.integer :am_brush_days
      t.integer :pm_brush_days

      t.timestamps
    end
  end
end
