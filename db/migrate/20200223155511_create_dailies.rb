class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.date :date
      t.string :habit
      t.boolean :done

      t.timestamps
    end
  end
end
