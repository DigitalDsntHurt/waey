class CreateSleeps < ActiveRecord::Migration[6.0]
  def change
    create_table :sleeps do |t|
      t.date :date
      t.integer :hrs
      t.integer :mins
      t.float :total_hrs
      t.float :total_mins

      t.timestamps
    end
  end
end
