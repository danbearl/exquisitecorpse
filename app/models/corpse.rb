class Corpse < ActiveRecord::Base

  has_many :authors, through: :snippets
  has_many :comments
  has_many :likes
  has_many :snippets
  before_save :check_for_closure

  default_scope { order('updated_at DESC') }

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

  private

  def check_for_closure
    if body.length > 3000
      self.closed = true

      self.authors.uniq.each do |author|
        Notifier.notify(user_id: author.id, message: "<a href='corpses/#{self.id}'>Corpse ##{self.id}</a>, to which you contributed, is now complete.")
      end
    end
  end

end
