class CreateUserAndOrderForm
  include ActiveModel::Model

  attr_accessor :email, :count_of_products, :total_price, :region, :warehouse, :user_first_name, :user_last_name, :phone

  validates :count_of_products, numericality: { only_integer: true, greater_than: 0 }
  # validates :total_price, numericality: { only_integer: true, greater_than: 0 }

  attr_reader :order
  attr_reader :contact_info

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
    user = User.where(email: email).first_or_create(password: SecureRandom.hex(4))
    ContactInfo.where(email: email,
                      phone: phone,
                      user_first_name: user_first_name,
                      user_last_name: user_last_name,
                      user_id: user.id).first_or_create

    @order = user.orders.create!(count_of_products: count_of_products,
                                 region: region,
                                 warehouse: warehouse,
                                 total_price: Product.first.price*count_of_products.to_i)

    @order.products << Product.first
  end
end
