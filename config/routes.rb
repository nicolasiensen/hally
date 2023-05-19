require 'sidekiq/web'

Rails.application.routes.draw do
  resources :story_requests, only: [:new, :show, :create]
  resources :stories, only: [:new, :show, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  if Rails.env.development?
    mount Sidekiq::Web => "/sidekiq"
  end

  # Defines the root path route ("/")
  root "stories#new"
end
