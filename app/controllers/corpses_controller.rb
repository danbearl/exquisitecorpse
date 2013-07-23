class CorpsesController < ApplicationController
  expose(:corpses)
  expose(:corpse, attributes: :corpse_params)

  def new
    @corpse = Corpse.new
    @corpse.snippets.build
  end

  def create
    corpse = Corpse.new(corpse_params)

    corpse.snippets.last.author_id = current_user.id

    if corpse.save
      redirect_to root_path, notice: "A new corpse has begun to grow."
    else
      redirect_to root_path, error: "Something went wrong."
    end
  end


  private

  def corpse_params
    params.require(:corpse).permit(snippets_attributes: :body)
  end

end
