class OrdersController < ApplicationController
  def new
    @create_user_and_order_form = CreateUserAndOrderForm.new
  end

  def create
    @create_user_and_order_form = CreateUserAndOrderForm.new(create_user_and_order_form_params)
    if @create_user_and_order_form.save
      redirect_to root_path, notice: "Order ID #{@create_user_and_order_form.order.id} has been created"
    else
      render :new
    end
  end

  private

  def create_user_and_order_form_params
    params.require(:create_user_and_order_form).permit(:email, :count_of_products, :total_price)
  end
end