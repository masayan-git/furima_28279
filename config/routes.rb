Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:destroy, :new, :create]
  resources :users, only: [:edit, :update, :new] 
end
