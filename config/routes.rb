Rails.application.routes.draw do

  # Home Page
  root "welcome#home"

  #Users
  resources :users
  get "/logout" => "users#destroy"

  # Posts
  resources :posts, only: [:create, :edit, :update, :destroy]

  # Sessions
  resources :sessions, only: [:new, :create]

  # Nested Resources
  resources :users, only: [:show] do
    resources :posts, only: [:show]
  end

end
