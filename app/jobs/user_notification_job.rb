class UserNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(user_email, order_id)
    user = User.find_by(email: user_email)
    order = Order.find_by(id: order_id)
    return if [order, user].include?(nil)

    UserMailer.notification_email(user.email, order).deliver_later
  end
end
