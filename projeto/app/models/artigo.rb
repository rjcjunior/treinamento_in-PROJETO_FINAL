class Artigo < ApplicationRecord
    belongs_to :user
    has_many :user_artigo, dependent: :destroy
    has_many :votos_artigo, dependent: :destroy
    self.per_page = 2
    
end
