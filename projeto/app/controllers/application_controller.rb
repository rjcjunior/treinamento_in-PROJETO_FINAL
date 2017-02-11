class ApplicationController < ActionController::Base
  before_action :authorize, except: [:new, :create]
  include SessionsHelper    
  protect_from_forgery with: :exception
  def authorize
        unless logged_in?
          redirect_to root_url
        end
  end
end
