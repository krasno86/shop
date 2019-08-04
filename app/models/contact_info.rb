class ContactInfo < ApplicationRecord
  belongs_to :user

  def address?
    # code here
  end
end
