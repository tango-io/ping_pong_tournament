Pinpong::Application.routes.draw do
  root to: "application#index"

  namespace :api do
    resources :round, only: [ :show ]
    resources :match, only: [ :show ]
    resources :teams, defaults: {format: :json}
  end
end
