Rails.application.routes.draw do
  match 'auth/register', via: %i[post get], as: :register
  match 'auth/login', via: %i[post get], as: :login
  get 'auth/logout', as: :logout
  resources :users
  resources :users
  get 'calc/index'
  get 'calc/result'
  post 'calc/result'
  get 'calc/cached'

  root 'calc#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end