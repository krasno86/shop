module ApplicationHelper
  def product_price_in_usd
    "#{Product.first.price}"
  end

  def product_price_in_hrivna
    "#{Product.first.price*@usd_rate}"
  end
end
