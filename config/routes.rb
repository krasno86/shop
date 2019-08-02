Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#show'

  resource :products, only: [:show]
  resource :contacts, only: [:show]

end
