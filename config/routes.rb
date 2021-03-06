  Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :follower_relationships, only: [:create, :index]
  end

  
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :follower_relationships, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
