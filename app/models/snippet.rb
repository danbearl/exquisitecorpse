class Snippet < ActiveRecord::Base

  belongs_to :corpse
  belongs_to :author, class_name: 'User'
  before_save :truncate_body

  def truncate_body
    if self.body.length > 300
      self.body = self.body[0,300]
    end
  end
  
end
