class ApplicationController < ActionController::Base
  expose(:random_corpse) { Corpse.where(closed: nil).sample }
  protect_from_forgery with: :exception
  
  helper_method :current_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
