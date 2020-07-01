Rails.application.routes.draw do

  # resources :guestsessions, only: [:create]
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  # post '/homes/guest_sign_in', to: 'homes#new_guest'
  root to: "posts#index"

  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

end