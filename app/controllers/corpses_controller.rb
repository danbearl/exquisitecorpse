class CorpsesController < ApplicationController
  expose(:corpses)
  expose(:corpse)

  def new
    corpse.snippets.build
  end

  def create
    @corpse = Corpse.new

    if @corpse.save
      redirect_to new_corpse_snippet_path(@corpse.id)
    else
      redirect_to root_path, error: "Something went wrong."
    end
  end
end
