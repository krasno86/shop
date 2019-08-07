class ContactsController < ApplicationController

  def show
    @merchant = User.get_merchant
    @contacts_info = Page.get_full_contacts_content(@merchant)
  end
end
