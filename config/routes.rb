Rails.application.routes.draw do
  resources :users do
    collection { get "search" }
    resources :tasks
  end
  resources :tasks
end
