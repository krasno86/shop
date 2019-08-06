class ContactsController < ApplicationController
  before_action :set_contact_info, only: [:show]

  def show; end

  private

  def set_contact_info
    @contact_info = User.get_merchant.contact_info.description
  end
end
