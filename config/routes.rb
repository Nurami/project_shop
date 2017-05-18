Rails.application.routes.draw do
  resources :orders, only: [:new, :show, :index]
  devise_for :users
  resources :products do
    resources :comments, shallow: true, only: [:create, :update, :destroy]
  end
  resources :cart_products, only: [:index, :new, :destroy]
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
