class UsersController < ApplicationController
  before_filter :require_user, except: [:new, :create]
  expose(:user)
  expose(:created_user) { User.new(user_params) }
  expose(:friend) { User.find(params[:friend_id]) }

  def create
    created_user.build_profile

    if created_user.save
      redirect_to root_path, notice: "You're signed up!"
    else
      render :new, notice: "Something went wrong!"
    end
  end

  def update

    if User.authenticate(current_user.email, params[:user][:password])
      if current_user.update_attributes(email: params[:user][:email], name: params[:user][:name])
        redirect_to profile_path(current_user.profile.id), notice: "Account information updated."
      else
        render 'edit'
      end
    else
      redirect_to edit_user_path(current_user.id), notice: 'Incorrect password'
    end
  end

  def add_friend
    current_user.add_friend(friend)
    Notifier.notify(user_id: friend.id, message: "#{view_context.link_to(current_user.name, current_user.profile)} added you as a friend!")

    redirect_to profile_path(friend.profile.id), notice: "Friend Added"
  end

  def remove_friend
    current_user.remove_friend(friend)

    redirect_to profile_path(friend.profile.id), notice: "Friend Removed"
  end

  def update_password
    if User.authenticate(current_user.email, params[:old_password])
      if params[:password] == params[:password_confirmation]
        # current_user.update_password(params[:new_password])    
        current_user.update(user_params)
        redirect_to current_user.profile, notice: "Password successfully updated."
      else
        render 'change_password', notice: "Password confirmation does not match new password."
      end
    else
      render 'change_password', notice: "Incorrect password."
    end
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end
