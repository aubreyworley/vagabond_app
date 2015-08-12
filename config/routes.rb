Rails.application.routes.draw do

  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  get '/users/edit', to: "users#edit"
  post '/users/edit', to: 'users#update'
  put '/users/edit', to: 'users#update', as: :user

  resources :users

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"

  # post "/sessions", to: "sessions#create" 
  resources :sessions, only: [:create]

  # stories routes
  get "/stories/edit", to: "stories#edit"
  post "/stories/edit", to: "stories#update"
  put '/stories/edit', to: "stories#update"
  delete "/stories/destroy", to: "stories#destroy"
  resources :stories, except: [:index]

  # cities routes
  resources :cities, only: [:show]

  root "site#index"

end
