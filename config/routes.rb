Rails.application.routes.draw do
  get 'tops/index'
  devise_for :users
  root to:"tops#index"
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :buds,only: [:create, :destroy]
  end
  resources :users, only: :show
end
