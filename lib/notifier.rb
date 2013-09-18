class Notifier
  include ActiveRecord

  def self.notify(args = {})
    note = Notification.new(user_id: args[:user_id], message: args[:message])
    note.save!
  end

end
