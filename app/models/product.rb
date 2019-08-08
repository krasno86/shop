class Product < ApplicationRecord
  has_and_belongs_to_many :orders
  belongs_to :user

  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                    numericality: { greater_than: 0, less_than: 1000000 }
end
