Rails.application.routes.draw do
  root 'articles#index'
  resources :users, except: [:index]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :articles, except: [:index]
  resources :categories, except: [:destroy]
  resources :votes, only: [:create, :destroy]

end
