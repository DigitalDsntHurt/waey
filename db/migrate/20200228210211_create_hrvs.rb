class CreateHrvs < ActiveRecord::Migration[6.0]
  def change
    create_table :hrvs do |t|
      t.date :date
      t.integer :hrv

      t.timestamps
    end
  end
end
