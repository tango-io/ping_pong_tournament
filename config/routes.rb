Pinpong::Application.routes.draw do
  root to: "application#index"

  namespace :api do
    resources :match, only: [ :show ]
  end
end
