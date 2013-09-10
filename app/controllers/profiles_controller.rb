class ProfilesController < ApplicationController
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

end
