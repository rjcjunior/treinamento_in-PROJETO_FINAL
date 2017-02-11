class Artigo < ApplicationRecord
    belongs_to :user
    has_many :user_artigo, dependent: :destroy
end
