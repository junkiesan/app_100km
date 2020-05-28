Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    member do
      get 'custom', to: 'trips#custom'
    end
  end
  resources :venues do
    resources :reviews, only: [:new, :create]
  end
  resources :trip_venues, only: [:create, :destroy]
  get "/profile", to: 'pages#profile'
end
