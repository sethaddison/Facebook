Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments
    member do
      get '/like', to: 'posts#like', as: :like
      get '/unlike', to: 'posts#unlike', as: :unlike
    end
  end
  devise_for :users

  get '/users', to: 'users#index', as: :users
  get '/:id', to: 'users#show', as: :user
  get '/:id/request', to: 'users#request_friendship', as: :request
  get '/:id/accept', to: 'users#accept_friendship', as: :accept
  get '/:id/decline', to: 'users#decline_fiendship', as: :decline
  get '/:id/unfriend', to: 'users#remove_friendship', as: :unfriend



end
