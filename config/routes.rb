Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "composition#index"

  resources :composition, except: [:show]
end
