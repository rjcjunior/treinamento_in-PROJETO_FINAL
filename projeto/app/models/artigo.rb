class Artigo < ApplicationRecord
    belongs_to :user
    has_many :user_artigo, dependent: :destroy
    has_many :votos_artigo, dependent: :destroy
    self.per_page = 6
    validates :titulo, :conteudo, :subtitulo, presence: true
    def self.search(params)
      artigos = all # for not existing params args
      artigos = artigos.where("subtitulo like ?", "%#{params[:search]}%") if params[:search]
      artigos
    end
   
end
