class User < ApplicationRecord
    has_secure_password
    before_save { self.nome = nome.downcase }
    has_many :artigo
    has_many :perguntum
    has_many :respostum
    has_many :user_artigo
end
