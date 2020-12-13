Rails.application.routes.draw do
  get 'products/index'
  get 'carts/new'
  get 'carts/create'
  get 'carts/show'
  get 'carts/destroy'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
