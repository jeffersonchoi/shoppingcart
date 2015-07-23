Rails.application.routes.draw do

  resources :users
  resources :items do
    resources :orders
  end
  resources :orders

  resources :orders do
    resources :orderitems
  end

  post 'add_to_cart' => 'cart_items#add_to_cart', as: :add_to_cart
  post 'update_item_quantity' => 'cart_items#update_item_quantity', as: :update_item_quantity_path

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/checkout' => 'orders#checkout', as: :checkout
end
