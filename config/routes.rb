Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # "/" goes to products index display
  root to: 'products#index'
  # carts controller
  resources :carts, only: [:show, :destroy]
  # products controller
  resources :produtcs, only: [:index]

  resources :cart_skus, only: [:create, :destroy, :update]
end
