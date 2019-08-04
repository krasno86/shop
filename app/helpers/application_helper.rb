module ApplicationHelper
  def dollar_rate
    "$#{Usd.new.price}"
  end
end
