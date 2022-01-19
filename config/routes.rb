Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  resources :companies do
    member do
      put :renew_secret
    end
  end

  namespace :api do
    get '/me' => 'users#me'
    resources :users, only: [:index, :update, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "companies#index"
end
