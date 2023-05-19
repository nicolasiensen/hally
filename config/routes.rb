Rails.application.routes.draw do
  resources :story_requests, only: [:new, :show, :create]
  resources :stories, only: [:new, :show, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "stories#new"
end
