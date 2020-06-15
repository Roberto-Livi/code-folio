Rails.application.routes.draw do

  # Home Page
  root "welcome#home"

  #Users
  resources :users
  get "/logout" => "users#destroy"

  # Posts
  resources :posts

  # Sessions
  resources :sessions, only: [:new, :create]

end
