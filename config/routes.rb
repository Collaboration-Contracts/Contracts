Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'register', to: 'users#new', as: :register_path
  post 'users', to: 'users#create'
end
