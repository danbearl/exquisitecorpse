class ApplicationController < ActionController::Base
  expose(:random_corpse) { Corpse.where(closed: nil).sample }
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :require_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      redirect_to :root
    end
  end

end
