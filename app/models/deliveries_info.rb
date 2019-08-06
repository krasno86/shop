class DeliveriesInfo < ApplicationRecord
  belongs_to :user

  validates :delivery_type, presence: true
  validates :description, presence: true,
            length: { minimum: 12, maximum: 250 }
end
