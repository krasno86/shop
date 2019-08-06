class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user merchant admin]

  before_save :downcase_email

  has_one :contact_info
  has_many :products
  has_many :payment_infos
  has_many :delivery_infos
  has_many :orders

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :email, presence: true,
            uniqueness: true,
            case_sensitive: false,
            format: { with: EMAIL_REGEX_VALIDATE, message: 'Email invalid!' }

  def self.send_notifications(user_id, order_id)

    UserNotificationJob.perform_later(user_id, order_id)
    AdminNotificationJob.perform_later(self.admin_user_id, order_id)
  end

  def self.admin_user_id
    find_by(role: 'admin').id
  end

  private

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
