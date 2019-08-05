class OrdersController < ApplicationController
  def new
    @create_user_and_order_form = CreateUserAndOrderForm.new
    @regions = NovaPoshta.get_regions
  end

  def create
    @create_user_and_order_form = CreateUserAndOrderForm.new(user_and_order_form_params)
    if @create_user_and_order_form.save
      redirect_to root_path, notice: "Order ID #{@create_user_and_order_form.order.id} has been created"
    else
      render :new
    end
  end

  def get_warehouses
    warehouses = NovaPoshta.get_warehouses(params[:region])
    if warehouses
      render json: { warehouses: warehouses }, status: 200
    else
      render json: { status: 404 }
    end
  end

  private

  def user_and_order_form_params
    params.require(:create_user_and_order_form).permit(:email,
                                                       :phone,
                                                       :count_of_products,
                                                       :user_first_name,
                                                       :user_last_name,
                                                       :region,
                                                       :warehouse )
  end
end