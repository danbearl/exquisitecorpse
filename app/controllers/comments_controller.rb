class CommentsController < ApplicationController

  expose(:comments)
  expose(:comment)
  expose(:corpse)
  expose(:new_comment) { corpse.comments.build(comment_params) }

  def create
    new_comment.author_id = current_user.id

    if new_comment.save
      redirect_to corpse_path(corpse), notice: "Your comment has been recorded."
    else
      render 'corpses/show'
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :corpse_id)
  end

end
