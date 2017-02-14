class ApplicationController < ActionController::Base
  before_action :authorize, except: [:new, :create]
  include SessionsHelper    
  protect_from_forgery with: :exception
  def authorize
        unless logged_in?
          redirect_to root_url
        end
  end
  def authorize_admin
    unless @current_user.is_adm
      redirect_to root_url
    end
    #redirects to previous page
  end
end

