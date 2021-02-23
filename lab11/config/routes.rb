Rails.application.routes.draw do
  get 'calc/index'
  get 'calc/result'
  post 'calc/result'
  get 'calc/cached'

  root 'calc#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
