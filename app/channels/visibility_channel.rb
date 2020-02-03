class VisibilityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "visibility_channel"

    current_user.update_attribute(:online, true)

    broadcast_online
  end

  def unsubscribed
    current_user.update_attribute(:online, false)

    broadcast_online
  end

  private
  def broadcast_online
    ActionCable.server.broadcast "visibility_channel", users: User.online
  end
end
