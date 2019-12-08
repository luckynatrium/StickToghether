Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  devise_for :user, controllers: {

  }
  get '/user', to: 'users#show'
  resources :events


end
