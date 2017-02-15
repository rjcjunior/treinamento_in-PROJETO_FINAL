class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    has_secure_password
    validates :nome, :password, :email, presence: true
    has_many :artigo
    has_many :post
    has_many :user_artigo
    has_many :votos_artigo, dependent: :destroy
    has_many :votos_post, dependent: :destroy
    
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
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def self.search(params)
      users = all # for not existing params args
      users = users.where("email like ?", "%#{params[:search]}%") if params[:search]
      users
    end
end
