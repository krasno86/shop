class PaymentsAndDeliveriesController < ApplicationController
  before_action :set_merchant, only: [:show]

  def show
    @payment_and_delivery_info = @merchant.pages.find_by(page_type: 'shipment').html
  end

  private

  def set_merchant
    @merchant = User.get_merchant
  end
end
