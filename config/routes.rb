Pinpong::Application.routes.draw do
  devise_for :users, skip: :registrations
  root to: "teams#index"

  get '/scores'                      => 'scores#index'
  get 'api/templates/:template'     => 'api/templates#get'

  namespace :api do
    resources :round,       only: [ :show ]
    resources :match,       only: [ :show ] do
      member do
        post :clear_space
      end
    end
    resources :match_set,   only: [ :show ]
    resources :score,       only: [ :update ]
    resources :teams,       defaults: {format: :json}
  end

  resources :teams, only: [:index, :new ]
end
