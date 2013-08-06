class Corpse < ActiveRecord::Base

  has_many :snippets

  accepts_nested_attributes_for :snippets, reject_if: lambda { |a| a[:body].blank? }, allow_destroy: true

  def body
    text = ''

    self.snippets.each do |snippet|
      text += snippet.body + ' '
    end

    return text
  end

  def last_one_hundred

    if body.length < 100
      return body
    end

    body[body.length - 100, body.length - 1]
  end

end
