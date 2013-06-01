Pinpong::Application.routes.draw do
  root to: "application#index"

  get '/pages'                      => 'pages#index'
  get 'api/templates/:template'     => 'api/templates#get'

  namespace :api do
    resources :round,       only: [ :show ]
    resources :match,       only: [ :show ]
    resources :match_set,   only: [ :show ]
    resources :score,       only: [ :update ]
    resources :teams,       defaults: {format: :json}
  end
end
