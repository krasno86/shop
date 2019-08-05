module ApplicationHelper
  def dollar_rate
    "#{Usd.new.price}"
  end

  def product_price_in_usd
    "#{Product.first.price}"
  end

  def product_price_in_hrivna
    "#{Product.first.price*Usd.new.price}"
  end
end
