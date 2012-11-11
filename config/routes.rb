Patients::Application.routes.draw do
  get "ui/index"
  get "ui/about"
  get "ui/signup"
  get "ui/login"

  get "signup" => "users#new", :as => "signup"
  root :to => "users#new"
  resources :users

end
