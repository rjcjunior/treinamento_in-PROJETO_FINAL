class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    has_secure_password
    before_save { self.nome = nome.downcase }
    has_many :artigo
    has_many :perguntum
    has_many :respostum
    has_many :user_artigo
    
    # Sets the password reset attributes.
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest,  User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    # Sends password reset email.
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

end
