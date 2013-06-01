Pinpong::Application.routes.draw do
  devise_for :users, skip: :registrations
  root to: "teams#index"

  namespace :api do
    resources :round,       only: [ :show ]
    resources :match,       only: [ :show ]
    resources :match_set,   only: [ :show ]
    resources :score,       only: [ :update ]
    resources :teams,       defaults: {format: :json}
  end

  resources :teams, only: [:index, :new ]
end
