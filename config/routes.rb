Rails.application.routes.draw do

  # Home Page
  root "welcome#home"

  #Users
  resources :users, :except => [:destroy]
  get "/logout" => "users#destroy"

  # Posts
  resources :posts, only: [:create, :edit, :update]
  get "/deletepost" => "posts#destroy"

  # Sessions
  resources :sessions, only: [:new, :create]

  # Nested Resources
  resources :users, only: [:show] do
    resources :posts, only: [:show]
  end

end
