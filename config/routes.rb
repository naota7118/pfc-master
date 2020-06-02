Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :new, :create, :show, :edit, :destroy, :update]

  root to: "posts#index"
end