Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resource :user, only: [:show, :edit, :update]

  root to: 'events#index'
  resources :events
end
