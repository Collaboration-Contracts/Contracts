Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contracts#new'

  get   'register',   to: 'users#new'
  post  'users',      to: 'users#create'
  get   'dashboard',  to: 'contracts#index'
  get   'login',      to: 'sessions#new'
  post  'login',      to: 'sessions#create'
  get   'signout',    to: 'sessions#destroy'

  post  'contracts',  to: 'contracts#create'
  patch 'contracts/:id', to: 'contracts#update', as: 'contract'
end
