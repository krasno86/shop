class ContactsController < ApplicationController
  # before_action :set_contact_info, only: [:show]

  def show
    @merchant = User.get_merchant
    @page_content = @merchant.pages.find_by(page_type: 'contacts').html
  end

  private

  def set_contact_info
    # @contact_info = User.get_merchant.contact_info.description
    @merchant = User.get_merchant
    @page = @merchant.pages.html
  end
end
