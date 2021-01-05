Rails.application.routes.draw do
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
  resources :homes
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
end