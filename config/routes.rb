Rails.application.routes.draw do
  # The Rails router recognizes URLs and dispatches them to a controller's action
  
  root 'pages#home'                     
  get 'about', to: 'pages#about'
  resources :articles
  # root 'users#new'
  get 'signup', to: 'users#new'

  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
