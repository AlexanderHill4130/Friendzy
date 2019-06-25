Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'

  get "chats", to: "chatrooms#user_chatrooms"
  resources :pages, only: [:show ]
  resources :places, only: :index
  resources :users, only: [:index] do
     resources :user_interests, only: [:new, :create]
  end
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places do
    resources :chatrooms do
      get "/add_participant/:id", to: 'chatrooms#add_participant', as: "add_participant"
      delete "/remove_participant/:id", to: 'chatrooms#remove_participant', as: "remove_participant"
      resource :chatroom_users
      resources :messages
    end
  end
end
