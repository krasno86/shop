class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user merchant admin]

  before_save :downcase_email

  has_one :contact_info, dependent: :destroy
  has_one :payment_and_delivery_info, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :email, presence: true,
            uniqueness: true,
            case_sensitive: false,
            format: { with: EMAIL_REGEX_VALIDATE, message: 'Email invalid!' }

  def self.admin_id
    find_by(role: 'admin').id
  end

  def self.get_merchant
    find_by(role: 'merchant')
  end

  private

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
