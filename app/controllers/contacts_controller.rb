class ContactsController < ApplicationController
  def show
    @contact_info_content = User.get_merchant.contact_info.description
  end
end
