Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#show'

  resource :products, only: [:show]
  resource :contacts, only: [:show]
  resource :payments_and_deliveries, only: [:show]
  resource :orders, only: [:new, :create] do
    get 'get_warehouses', to: 'orders#get_warehouses'
  end
end
