Rails.application.routes.draw do
  get 'users/new'

  root to: 'articles#index'
  resources :users
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
