Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :plants

    root to: 'homepage#index'

    get 'homepage' => 'homepage#index'

    get 'watering' => 'logic#calc_watering'
    get 'logic/ajax'

    get '/users' => 'homepage#index'

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
