class Snippet < ActiveRecord::Base

  belongs_to :corpse
  belongs_to :author, class_name: 'User'
  
end
