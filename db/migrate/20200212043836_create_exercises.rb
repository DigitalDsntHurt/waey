class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.date :date
      t.text :description
      t.integer :total_minutes

      t.timestamps
    end
  end
end
