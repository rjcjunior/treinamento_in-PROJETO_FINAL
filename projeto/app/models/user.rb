class User < ApplicationRecord
    has_secure_password
    before_save { self.nome = nome.downcase }
end
