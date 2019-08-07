class ProductsController < ApplicationController
  def show
    @product = Product.first
    @product_content = @product.description
  end
end
