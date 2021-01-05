Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'
  resources :homes
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
  
end