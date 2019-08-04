class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user merchant admin]

  has_one :contact_info

  has_many :products
  has_many :payment_infos
  has_many :deliveries_infos
  has_many :orders
end
