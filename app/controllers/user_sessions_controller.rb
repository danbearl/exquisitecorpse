class UserSessionsController < ApplicationController

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully signed in!"
    else
      flash.now.alert = "Invalid name or password"
      render "new"
    end
  end
end
