class ContactInfo < ApplicationRecord
  belongs_to :user

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :phone, presence: {message: 'Only positive number without spaces are allowed'},
            numericality: true,
            length: { minimum: 10, maximum: 15 }
  validates :email, presence: true,
            case_sensitive: false,
            format: { with: EMAIL_REGEX_VALIDATE, message: 'invalid!' }

end
