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

end
