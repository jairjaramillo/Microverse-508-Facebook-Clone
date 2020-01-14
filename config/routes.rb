Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :friendships, only: [:create, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :users, except: [:new]
  resources :posts
  resources :comments, only: [:new, :create, :edit, :destroy, :update]

  get 'users/new', to: 'devise/registrations#new'
  get 'friends/', to: 'friendships#friends'
  post 'friendships/:id', to: 'friendships#update'
  get 'friends/requests', to: 'friendships#index'

  get 'privacy_policy', to: 'static_pages#index'

  root to: 'posts#index'

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_facebook_user_session
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
