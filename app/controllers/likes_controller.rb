class LikesController < ApplicationController
  expose(:like)

  def new
    like = Like.new(like_params)

    like.save

    redirect_to corpse_path(params[:corpse_id])
  end

  def destroy
    like.destroy

    redirect_to corpse_path(params[:corpse_id])
  end

  private
  
  def like_params
    params.permit(:user_id, :corpse_id)
  end
end
