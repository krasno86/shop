class PaymentsAndDeliveriesController < ApplicationController
  before_action :set_merchant, only: [:show]

  def show
    @payment_infos = @merchant.payment_infos
    @deliveries_infos = @merchant.deliveries_infos
  end

  private

  def set_merchant
    @merchant = Product.first.user
  end
end
