json.extract! journal_entry, :id, :prompt_id, :content, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)
