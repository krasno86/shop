class UserMailer < ApplicationMailer
  def notification_email(email, order)
    @order = order

    mail to: email, subject: 'Shop new order notification'
  end
end
