class SnippetsController < ApplicationController
  expose(:snippet, attributes: :snippet_params)
  expose(:parent) {Corpse.find(params[:corpse_id])}

  def create
    snippet.author_id = current_user.id
    snippet.corpse_id = params[:snippet][:corpse_id]

    if snippet.save
      snippet.corpse.save!
      if snippet.corpse.closed
        redirect_to corpse_path(snippet.corpse_id), notice: "The corpse is now complete."
      else
        redirect_to :root, notice: "The corpse has grown."
      end
    else
      redirect_to root_path, error: "You broke it."
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:body)
  end
end
