class Artigo < ApplicationRecord
    belongs_to :user
    has_many :user_artigo, dependent: :destroy
    has_many :votos_artigo, dependent: :destroy
    self.per_page = 2
    def self.search(params)
      artigos = all # for not existing params args
      artigos = artigos.where("titulo like ?", "%#{params[:search]}%") if params[:search]
      artigos
    end
end
