Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [:show ]
  resources :places, only: :index
  resources :users, only: [:index] do
     resources :user_interests, only: [:new, :create]
  end
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
end
