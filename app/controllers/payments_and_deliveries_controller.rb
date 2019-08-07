class PaymentsAndDeliveriesController < ApplicationController
  before_action :set_merchant, only: [:show]

  def show
    @payment_and_delivery_info = @merchant.payment_and_delivery_info.description
  end

  private

  def set_merchant
    @merchant = User.get_merchant
  end
end
