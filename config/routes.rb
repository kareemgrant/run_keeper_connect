require 'resque/server'

Blog::Application.routes.draw do
  mount Resque::Server, :at => "/resque"

  resources :users
  resources :activities

  get '/runs', to: 'activities#index', as: 'runs'
  get '/runs/:id', to: 'activities#show', as: 'run_detail'
  post '/fetch_runs', to: 'activities#fetch_runs', as: 'fetch_runs'

  root to: 'users#index'

  match 'auth/:provider/callback', to: 'sessions#create'

  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
