class ContactInfo < ApplicationRecord
  belongs_to :user
  before_save :downcase_email

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :description, presence: true
  validates :email, presence: true,
            uniqueness: true,
            case_sensitive: false,
            format: { with: EMAIL_REGEX_VALIDATE, message: 'Email invalid!' }

  validates :phone, presence: {message: 'Only positive number without spaces are allowed'},
            numericality: true,
            length: { minimum: 10, maximum: 15 }

  def self.get_contacts(merchant)
    email = merchant.contact_info.email
    phone = merchant.contact_info.phone
    [email, phone]
  end

  private

  def downcase_email
    email.delete(' ').downcase
  end
end
