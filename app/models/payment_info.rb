class PaymentInfo < ApplicationRecord
  belongs_to :user

  validates :payment_type, presence: true
  validates :description, presence: true,
            length: { minimum: 12, maximum: 250 }
end
