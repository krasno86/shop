class AdminNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(user_id, order_id)
    user = User.find_by(id: user_id)
    order = Order.find_by(id: order_id)
    return if [order, user].include?(nil)

    AdminMailer.notification_email(user.email, order).deliver_later
  end
end
