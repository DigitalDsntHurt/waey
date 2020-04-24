class Prompt < ApplicationRecord
  has_many :journal_entries

  def self.use_order
    JournalEntry.all.order(:updated_at).pluck(:prompt_id).reverse.uniq.map{|prompt_id| Prompt.where(id: prompt_id)[0] }
  end
end
