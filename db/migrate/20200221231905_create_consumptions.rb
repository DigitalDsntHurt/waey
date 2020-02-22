class CreateConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :consumptions do |t|
      t.datetime :datetime
      t.text :desciption
      t.integer :feeling_score
      t.boolean :win

      t.timestamps
    end
  end
end
