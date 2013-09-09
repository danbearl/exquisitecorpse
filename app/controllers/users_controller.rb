class UsersController < ApplicationController
   expose(:user)
   expose(:created_user) { User.new(user_params) }

   def create
     created_user.build_profile

     if created_user.save
       redirect_to root_path, notice: "You're signed up!"
     else
       render :new, notice: "Something went wrong!"
     end
   end

   private

   def user_params
      user_params = params.require(:user).permit(:email, :password, :password_confirmation, :name)
   end

end
