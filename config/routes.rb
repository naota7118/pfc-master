Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"
  resources :posts, only: [:new, :create, :show, :edit, :destroy, :update]
  resources :users, only: [:edit, :update]

end