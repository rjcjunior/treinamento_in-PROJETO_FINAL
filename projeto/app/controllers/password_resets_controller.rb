class PasswordResetsController < ApplicationController

  def new
  end
  
  def create
    a = params[:resposta]
    b = params[:password]
    c = params[:password_confirmation]
    @user = User.find_by(email: params[:email].downcase)
    if @user
        @user.recuperarsenha
    else
        flash.now[:danger] = "Email address not found"
        redirect_to root_url
    end
  end

  def edit
  end
  
  private
    def password_reset_params
      params.require(:password_resets).permit(:email, :password, :cpf)
    end
end
