Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show]
  resources :posts # only: [:index, :new, :create, :show, :edit, :destroy, :update] 7つ全部使うので消した

  root to: "posts#index"
end