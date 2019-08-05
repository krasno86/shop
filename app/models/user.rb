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
  has_many :deliveries_infos
  has_many :orders

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :email, presence: true,
            uniqueness: true,
            case_sensitive: false,
            format: { with: EMAIL_REGEX_VALIDATE, message: 'Email invalid!' }

  private

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
