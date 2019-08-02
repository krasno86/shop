Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resource :products, only: [:show]
  root to: 'products#show'
end
