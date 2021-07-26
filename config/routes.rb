Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  post '/add_item_cart', to: 'carts#add_to_cart'
  get '/get_estate', to: 'checkout#estate'
  resources :products
  resources :merchant_accounts
  resources :checkout, only: [:index]
  resources :addresses
  resource :cart, except: [:create]
end
