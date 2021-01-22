Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, except: [:index, :show]
  resources :orders, only: [:index, :create]
end