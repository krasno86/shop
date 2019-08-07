class CreateUserAndOrderForm
  include ActiveModel::Model

  EMAIL_REGEX_VALIDATE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  attr_accessor :email, :count_of_products, :region, :warehouse, :user_first_name, :user_last_name, :phone, :register, :password
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
  validates :password, length: {minimum: 8, maximum: 40}, allow_blank: true


  def save
    if valid?
      persist!
      true
    else
      false
    end
  end


  validate :check_password_format

  def check_password_format
    if password.present? && register == '1'
      regexps = {' must contain at least one lowercase letter': /[a-z]+/,
                 ' must contain at least one digit': /\d+/}
      regexps.each do |rule, reg|
        errors.add(:password, rule) unless password.match(reg)
      end
    end
  end

  private

  def persist!
    if register == '1'
      user = User.where(email: email).first_or_create(password: password,
                                                      phone: phone,
                                                      user_first_name: user_first_name,
                                                      user_last_name: user_last_name)

      @order = user.orders.create!(count_of_products: count_of_products,
                                   region: region,
                                   warehouse: warehouse,
                                   total_price: Product.first.price*count_of_products.to_i)
    else
      @order = Order.create!(email: email,
                             count_of_products: count_of_products,
                             phone: phone,
                             user_first_name: user_first_name,
                             user_last_name: user_last_name,
                             region: region,
                             warehouse: warehouse,
                             total_price: Product.first.price*count_of_products.to_i)
    end

    @order.products << Product.first

    Order.send_notifications(email, @order.id) if email && @order
  end
end
