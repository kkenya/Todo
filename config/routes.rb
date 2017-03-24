Rails.application.routes.draw do
  root "users#index"
  resources :users do
    collection { get "search" }
    resources :tasks, except: [:show]
  end
  # resources :tasks
  resource :session, only: [:create, :destroy]
end
