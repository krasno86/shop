class CreateUserAndOrderForm
  include ActiveModel::Model

  attr_accessor :email, :count_of_products, :total_price, :user_first_name, :user_last_name, :region, :warehouse

  validates :count_of_products, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, numericality: { only_integer: true, greater_than: 0 }

  attr_reader :order

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    user = User.create!(email: email, password: SecureRandom.hex(4))
    @order = user.orders.create!(count_of_products: count_of_products,
                                 user_first_name: user_first_name,
                                 user_last_name: user_last_name,
                                 region: region,
                                 warehouse: warehouse,
                                 total_price: Product.first.price*count_of_products)
  end
end
