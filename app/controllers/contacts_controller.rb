class ContactsController < ApplicationController
  before_action :set_contacts, only: [:show]

  def show; end

  private

  def set_contacts
    @contacts = Product.first.user.contact_info
  end
end
