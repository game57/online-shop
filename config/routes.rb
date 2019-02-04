Rails.application.routes.draw do
  resources :users
  get "/sign-up", to: "users#new"
end
