Rails.application.routes.draw do
  


  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, only: [:create]

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"  

  # post "/sessions", to: "sessions#create" 
  resources :sessions, only: [:create]

  # stories routes
  resources :stories, except: [:index]

  root "site#index"

end
