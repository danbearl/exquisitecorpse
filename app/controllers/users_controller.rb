class UsersController < ApplicationController
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

   def add_friend
     current_user.add_friend(friend)
     Notifier.notify(user_id: friend.id, message: "#{view_context.link_to(current_user.name, current_user.profile)} added you as a friend!")

     redirect_to profile_path(friend.profile.id), notice: "Friend Added"
   end

   def remove_friend
     current_user.remove_friend(friend)

     redirect_to profile_path(friend.profile.id), notice: "Friend Removed"
   end

   private

   def user_params
      user_params = params.require(:user).permit(:email, :password, :password_confirmation, :name)
   end

end
