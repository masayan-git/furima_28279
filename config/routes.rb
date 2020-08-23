Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :procedures, only: [:index, :create]
  end
  resources :users, only: [:edit, :update, :new] 
  
end
