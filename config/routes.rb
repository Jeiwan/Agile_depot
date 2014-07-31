Rails.application.routes.draw do

  get '/place_product' => 'products#new', as: 'place_product'
  resources :products, only: [:index, :show, :create]

  get '/signup' => 'sellers#new', as: 'signup'
  get '/dashboard' => 'sellers#index', as: 'dashboard'
  resources :sellers, only: [:create]

  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create]

  root "products#index"
end
