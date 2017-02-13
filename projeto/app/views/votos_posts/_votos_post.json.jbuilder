json.extract! votos_post, :id, :user_id, :post_id, :votoPost, :created_at, :updated_at
json.url votos_post_url(votos_post, format: :json)