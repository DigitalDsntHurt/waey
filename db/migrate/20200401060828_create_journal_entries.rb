class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.integer :prompt_id
      t.text :content

      t.timestamps
    end
  end
end
