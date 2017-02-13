class Post < ApplicationRecord
    belongs_to :user
    has_many :post_artigo, dependent: :destroy

end
