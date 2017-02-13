json.extract! votos_artigo, :id, :user_id, :artigo_id, :votoArtigo, :created_at, :updated_at
json.url votos_artigo_url(votos_artigo, format: :json)