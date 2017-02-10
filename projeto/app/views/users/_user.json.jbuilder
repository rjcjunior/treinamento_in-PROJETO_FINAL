json.extract! user, :id, :nome, :email, :password_digest, :is_adm, :created_at, :updated_at
json.url user_url(user, format: :json)