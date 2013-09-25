class PagesController < ApplicationController
  expose(:recent_corpses) { Corpse.where("closed = true").limit(5) }
  expose(:recent_snippets) { Snippet.all.order("created_at DESC").limit(5) }
  expose(:recent_posts) { Post.all.order("created_at DESC").limit(5) }
end
