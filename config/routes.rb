Pinpong::Application.routes.draw do
  devise_for :users
  root to: "application#index"

  namespace :api do
    resources :round,       only: [ :show ]
    resources :match,       only: [ :show ]
    resources :match_set,   only: [ :show ]
    resources :score,       only: [ :update ]
    resources :teams,       defaults: {format: :json}
  end

  resources :teams, only: [ :new ]
end
