require 'sidekiq/web'

Rails.application.routes.draw do

  resources :faches
  resources :relationships,       only: [:create, :destroy]
  root 'static_pages#home'

  get '/imprint', to: 'static_pages#imprint'
  get '/privacy', to: 'static_pages#privacy'
  get '/about',   to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'
  

  resources :posts do 
    resources :favorites, only: [:create, :destroy]
  end
  
  authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users

  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  
end
