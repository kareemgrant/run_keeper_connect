Blog::Application.routes.draw do
  resources :articles
  resources :users

  root to: 'articles#index'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
