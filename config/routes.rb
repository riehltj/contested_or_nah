Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "composition#index"

  resources :composition, except: [:show]

  get '/admin', to: 'admin#index'

  namespace :admin do
    resources :compositions
  end
end
