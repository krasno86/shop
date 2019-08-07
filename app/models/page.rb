class Page < ApplicationRecord
  belongs_to :user

  enum page_type: %i[contacts shipment]

  def self.get_full_content(merchant)
    page_content = merchant.pages.find_by(page_type: 'contacts').html
    self.add_contact_info(page_content, merchant)
  end

  def self.add_contact_info(page_content, merchant)
    email, phone = ContactInfo.get_contacts(merchant)
    self.merge_contact_info(page_content, email, phone)
  end

  def self.merge_contact_info(page_content, email, phone)
    parsed_page = Nokogiri.parse(page_content)
    email_node = parsed_page.at_css '.email'
    phone_node = parsed_page.at_css '.phone'
    email_node.content = "email: #{email}"
    phone_node.content = "phone: #{phone}"
    parsed_page.to_s
  end
end
