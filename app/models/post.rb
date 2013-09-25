class Post < ActiveRecord::Base
  default_scope("created_at DESC")
end
