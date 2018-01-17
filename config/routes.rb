Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'register', to: 'users#new'
  post 'users', to: 'users#create'
  get 'dashboard', to: 'contracts#index'
end
