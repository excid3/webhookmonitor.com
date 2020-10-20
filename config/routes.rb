require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :projects do
    resources :events
  end

  resources :webhooks

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'


  authenticated :user do
    root to: "projects#index", as: :authenticated_root
  end

  root to: 'home#index'
end
