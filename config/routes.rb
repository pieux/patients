Patients::Application.routes.draw do

  #get "ui/index"
  #get "ui/about"
  #get "ui/signup"
  #get "ui/login"

  match "ui(/:action)", :controller => "ui"

  get "signup" => "users#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  root :to => "users#new"

  resources :users
  resources :sessions
end
