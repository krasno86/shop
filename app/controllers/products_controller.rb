class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def show
    @product_info = Page.get_full_product_content(@product).html_safe
  end

  private

  def set_product
    @product = Product.last
  end
end
