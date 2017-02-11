json.extract! user_artigo, :id, :user_id, :artigo_id, :created_at, :updated_at
json.url user_artigo_url(user_artigo, format: :json)