class PostsController < ApplicationController
  expose(:posts)
  expose(:post)
  expose(:created_post) { Post.new(post_params) }
  
  def create
    if created_post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render :new, notice: "Something went wrong!"
    end
  end
  
  def update
    if post.update(post_params)
      redirect_to posts_path, notice: "Post updated."
    else
      render edit
    end
  end

  def destroy
    post.delete

    redirect_to posts_path, notice: "Post successfully deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
