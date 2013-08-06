class PagesController < ApplicationController
  expose(:random_corpse) { Corpse.all.sample }
end
