class Page < ApplicationRecord
  belongs_to :user

  enum page_type: %i[contacts shipment]
end
