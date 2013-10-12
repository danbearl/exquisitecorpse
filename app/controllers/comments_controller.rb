class CommentsController < ApplicationController

  expose(:comments)
  expose(:comment)
  # expose(:new_comment) { Comment.new(comment_params) }
  expose(:corpse)

  def create
    @comment = corpse.comments.create(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to corpse_path(corpse), notice: "Your comment has been recorded."
    else
      render 'corpses/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
