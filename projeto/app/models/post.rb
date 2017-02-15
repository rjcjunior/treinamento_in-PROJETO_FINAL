class Post < ApplicationRecord
    belongs_to :user
    has_many :votos_post, dependent: :destroy
    has_many :post, dependent: :destroy
    validates :conteudo, presence: true
    
    def self.search(params)
      posts = all # for not existing params args
      posts = posts.where("tag like ?", "%#{params[:search]}%") if params[:search]
      posts
    end
    

end
