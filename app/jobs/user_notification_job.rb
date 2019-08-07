class UserNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(email, order_id)
    order = Order.find_by(id: order_id)

    UserMailer.notification_email(email, order).deliver_later
  end
end
