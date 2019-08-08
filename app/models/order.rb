class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :products

  enum status: %i[recent processed sent]

  validates :status, presence: true
  validates :count_of_products, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                          numericality: { greater_than: 0, less_than: 1000000 }
  validates :phone, length: { minimum: 10, maximum: 15 }, allow_blank: true
  validates :region, presence: true
  validates :warehouse, presence: true

  def self.send_notifications(email, order_id)
    UserNotificationJob.perform_later(email, order_id) if email && order_id
    AdminNotificationJob.perform_later(User.admin_id, order_id)
  end
end
