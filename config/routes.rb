Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create,:destroy]
  resources :relationships, only: [:create, :destroy]

  root 'staticpages#home'
  get 'staticpages/home'
  get '/about', to: 'staticpages#about'
  get '/contact', to: 'staticpages#contact'
  get '/signup', to: 'user#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
end
