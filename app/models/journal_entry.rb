class JournalEntry < ApplicationRecord
  belongs_to :prompt
  has_rich_text :content
end
