class NotificationsController < ApplicationController
  before_filter :require_user
  after_filter :mark_as_read, only: [:index]

  expose(:notification)
  expose(:notifications) { Notification.where('user_id = ?', current_user.id) }
  expose(:read_notifications) { notifications.keep_if { |note| note.read } }

  def destroy
    notification.delete

    redirect_to notifications_path
  end

  private

  def mark_as_read
    unread_notifications.each do |note|
      note.read = true
      note.save!
    end
  end

end
