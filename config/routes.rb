Rails.application.routes.draw do
  get 'drivers/depart'
  get 'drivers/more'

  get 'secrets/index'

  get 'secrets/create'

  get 'secrets/new'

  get 'secrets/edit'

  get 'secrets/update'

  get 'secrets/destroy'

  get 'users/new'
  
  post 'photos' => 'photos#upload'

  match '', to: 'secrets#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www'}, via: 'get'

  root to: 'articles#index'
  resources :users
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  match '/fache', to: 'drivers#depart', via: 'get'# 老司机
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/data', to: 'drivers#dataAnalysis', via: 'get' # 数据分析
  # 配置二级域名 secret.localhost:3000.com
  #constraints :subdomain => Rails.configuration.mobile_subdomain do
  #  resources :secrets
 # end
#  constraints :subdomain => Rails.configuration.main_subdomain do
    resources :secrets
    # 下面是其他路由，比如
 # end

end
