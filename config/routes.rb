Rails.application.routes.draw do
  resources :chatroom_users
  resources :messages
  resources :chatrooms
  resources :users

  post "/chatrooms/:id", to: "chatrooms#join"
  post "user/login", to: "users#login"

  root"chatrooms#index"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
