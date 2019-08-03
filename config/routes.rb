Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :room_messages
  resources :rooms

  root 'rooms#index'

  mount ActionCable.server, at: '/cable'

end
