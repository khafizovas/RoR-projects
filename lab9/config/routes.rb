Rails.application.routes.draw do
  root to: 'palindromes#index'
  get 'palindromes/index'
  get 'palindromes/ajax'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
