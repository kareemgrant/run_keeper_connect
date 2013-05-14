Blog::Application.routes.draw do
  resources :users
  resources :activities

  get '/runs', to: 'activities#index', as: 'runs'
  get '/runs/:id', to: 'activities#show', as: 'run_detail'

  root to: 'users#index'

  match 'auth/:provider/callback', to: 'sessions#create'

  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
