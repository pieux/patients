Patients::Application.routes.draw do

  #get "ui/index"
  #get "ui/about"
  #get "ui/signup"
  #get "ui/login"

  # decline get
  post "all_plans" => "ui#all_plans"
  get "plan" => "ui#plan", as: "plan"
  match "ui(/:action)", :controller => "ui"

  get "signup" => "users#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  root :to => "ui#plan"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
