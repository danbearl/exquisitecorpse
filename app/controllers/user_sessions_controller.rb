class UserSessionsController < ApplicationController

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully logged in!"
    else
      flash.now.alert = "Invalid name or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Logged out!"
  end
end
