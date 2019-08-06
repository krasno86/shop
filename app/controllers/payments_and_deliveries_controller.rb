class PaymentsAndDeliveriesController < ApplicationController
  before_action :set_merchant, only: [:show]

  def show
    @payment_infos = @merchant.payment_infos
    @delivery_infos = @merchant.delivery_infos
  end

  private

  def set_merchant
    @merchant = User.find_by(role: 'merchant')
  end
end
