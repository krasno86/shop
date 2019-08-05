class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  STATUSES = ['new', 'in progress', 'sent'].freeze

  validates :status, inclusion: { in: STATUSES }, presence: false
  validates :count_of_products, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                          numericality: { greater_than: 0, less_than: 1000000 }
  validates :region, presence: true
  validates :warehouse, presence: true
end
