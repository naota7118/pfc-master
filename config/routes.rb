Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'standards', to: 'users/registrations#new_standard'
    post 'standards', to: 'users/registrations#create_standard'
  end

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

  resources :charts, only: :index

  resources :relationships, only: [:create, :destroy]

end