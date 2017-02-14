class Post < ApplicationRecord
    belongs_to :user
    has_many :votos_post, dependent: :destroy
    has_many :post, dependent: :destroy

end
