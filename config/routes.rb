Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :places, only: :index
  resources :users, only: [:index]
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places
  resources :chatrooms do
    resource :chatroom_users
  end
end
