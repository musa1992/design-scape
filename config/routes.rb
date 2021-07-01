Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  post '/add_item_cart', to: 'cart#add_to_cart'
  resources :products
  resources :merchant
  resources :cart, except: [:create]
end
