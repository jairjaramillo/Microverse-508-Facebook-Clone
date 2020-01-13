Rails.application.routes.draw do
  devise_for :users
  resources :likes, only: [:create, :destroy]
  resources :users, except: [:new]
  resources :posts
  resources :comments, only: [:new, :create, :edit, :destroy, :update]

  get 'users/new', to: 'devise/registrations#new'

  root to: 'posts#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
