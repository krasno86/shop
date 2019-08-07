class ContactsController < ApplicationController

  def show
    @merchant = User.get_merchant
    @page_content = Page.get_full_content(@merchant)

    # @merchant = User.get_merchant
    # page_html = @merchant.pages.find_by(page_type: 'contacts').html
    # email = @merchant.contact_info.email
    # phone = @merchant.contact_info.phone
    # doc = Nokogiri.parse(page_html)
    # email_node = doc.at_css 'p.email'
    # phone_node = doc.at_css 'p.phone'
    # email_node.content = "email: #{email}"
    # phone_node.content = "phone: #{phone}"
    # @page_content = doc.to_s
  end
end
