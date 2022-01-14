Rails.application.routes.draw do
  root "companies#index"
  devise_for :users
  use_doorkeeper

  resources :companies do
    member do
      put :renew_secret
    end
  end

  namespace :api do
    resources :users, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
