json.extract! entry, :id, :content, :due_date, :user_id, :created_at, :updated_at
json.url entry_url(entry, format: :json)
