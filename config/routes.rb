Pinpong::Application.routes.draw do
  root to: "application#index"

  namespace :api do
    resources :round, only: [ :show ]
  end
end
