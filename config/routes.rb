Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
  resources :homes
end