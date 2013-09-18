class ApplicationController < ActionController::Base
  expose(:random_corpse) do 
    corpses = []
    Corpse.where(closed: nil).each do |corpse|
      unless corpse.snippets.last.author_id == current_user.id
        corpses << corpse
      end
    end
    corpses.sample
  end

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
