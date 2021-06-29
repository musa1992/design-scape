Rails.application.routes.draw do
  root to: 'products#index'
  post '/add_item_cart', to: 'cart#add_to_cart'
  resources :products
  resources :cart, except: [:create]
end
