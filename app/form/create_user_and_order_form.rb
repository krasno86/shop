class CreateUserAndOrderForm
  include ActiveModel::Model

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  attr_accessor :email, :count_of_products, :region, :warehouse, :user_first_name, :user_last_name, :phone
  attr_reader :order

  validates :count_of_products, numericality: { only_integer: true, greater_than: 0 }
  validates :phone, presence: {message: 'Only positive number without spaces are allowed'},
                    numericality: true,
                    length: { minimum: 10, maximum: 15 }
  validates :user_first_name, presence: {message: 'is mandatory, please specify one'}
  validates :user_last_name, presence: {message: 'is mandatory, please specify one'}
  validates :region, presence: {message: 'is mandatory, please specify one'}
  validates :warehouse, presence: {message: 'is mandatory, please specify one'}
  validates :email, presence: true,
                    case_sensitive: false,
                    format: { with: EMAIL_REGEX_VALIDATE, message: 'invalid!' }
  
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
    ContactInfo.where(phone: phone,
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
