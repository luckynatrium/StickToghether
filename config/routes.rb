Rails.application.routes.draw do
  root  'events#index', as: 'main_page' # Fixme overriding exciting phantom route with name root

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users # format: false
  resource :user, only: [:show, :update]

  get 'events/in', to: 'events#in', as: 'request'
  get 'events/out', to: 'events#out', as: 'cancel'
  resources :events do
    member do
      patch 'apply', to: 'events#apply', as: 'apply'
      delete 'reject', to: 'events#reject', as: 'reject'
    end
  end

end
