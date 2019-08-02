class ContactsController < ApplicationController
  before_action :set_merchant, only: [:show]

  def show; end

  private

  def set_merchant
    @merchant = Product.first.merchant
  end
end
