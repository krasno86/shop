class ContactInfo < ApplicationRecord
  belongs_to :user

  # validates :description, presence: true

  def self.get_contacts(merchant)
    email = merchant.contact_info.email
    phone = merchant.contact_info.phone
    [email, phone]
  end
end
