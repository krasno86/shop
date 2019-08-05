class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  # STATUSES = %w[new in_progress sent].freeze
  #
  # validates :status, inclusion: { in: STATUSES }, optional: true
end
