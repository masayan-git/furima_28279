Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'items/index'
  resources :items, only: [:index, :destroy]
  resources :users, only: [:edit, :update, :new] 
end
