Rails.application.routes.draw do
  get 'users/new'

  root to: 'articles#index'
  resources :users
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  # 配置二级域名 secret.localhost:3000.com
  constraints :subdomain => Rails.configuration.secret_subdomain do
  	scope module: 'secret', as: 'sescet' do
  		resources :articles
  	end
  end

end
