Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'

  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: :create
  end
end
