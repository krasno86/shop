require 'sidekiq/web'

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#show'

  resource :products, only: [:show]
  resource :contacts, only: [:show]
  resource :payments_and_deliveries, only: [:show]
  resource :orders, only: [:new, :create] do
    get 'get_warehouses', to: 'orders#get_warehouses'
    get 'complete', to: 'orders#order_complete'
  end
end
