Rails.application.routes.draw do
  resources :users do
    collection { get "search" }
  end
end
