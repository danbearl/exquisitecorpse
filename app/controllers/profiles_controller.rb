class ProfilesController < ApplicationController
  before_filter :require_owner, only: [:edit, :update]
  expose(:profile)

  def update
    if profile.update(profile_params)
      redirect_to profile, notice: "Profile upated."
    else
      render "edit"
    end
  end

  private

  def profile_params
    profile_params = params.require(:profile).permit(:about)
  end

  def require_owner
    unless current_user.id == profile.user_id
      redirect_to :root
    end
  end

end
