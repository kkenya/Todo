Rails.application.routes.draw do
  root "users#index"
  resources :users, except: [:show] do
    collection { get "search" }
    resources :tasks, except: [:show]
  end
  resource :account, only: [:edit, :update, :destroy] do
    get "retire"
  end

  resource :session, only: [:create, :destroy]
  # get "/login" => "sessions#create", as: :login
  # get "/logout" => "sessions#destroy", as: :logout
end
