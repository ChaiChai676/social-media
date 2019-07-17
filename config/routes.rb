Rails.application.routes.draw do
  devise_for :users

  resources :users

  # root to: 'pages#home'
  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms

  mount ActionCable.server, at: '/cable'

end
