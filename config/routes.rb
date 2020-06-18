Rails.application.routes.draw do
  devise_for :users
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