Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'books#index'

  resources :users, :sessions, :books

end
