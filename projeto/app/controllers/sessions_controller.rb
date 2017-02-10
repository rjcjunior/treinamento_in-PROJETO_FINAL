class SessionsController < ApplicationController
  
  before_action :nao_logado, :only => [:new, :create]
  
  def new
  end
  
  def create
        
        user = User.find_by(email: params[:session][:email].downcase)
        
        if user && user.authenticate(params[:session][:password])
        
          log_in user
        
          redirect_to users_path #depois mudar para a dashboard
        
        else
        
         flash.now[:danger] = 'Invalid email/password combination'
        
          render 'new'
        end
  end
  
  def destroy
    log_out
    redirect_to users_path
  end
  
  private 
  
    def nao_logado
      if logged_in?
        flash.now[:danger] = "Voce já está logado"
        redirect_to users_path
      end  
    end

end