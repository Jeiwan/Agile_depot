Rails.application.routes.draw do

  resources :products, only: [:index, :show]

  get '/sign_up' => 'sellers#new', as: :sign_up
  get '/dashboard' => 'sellers#index', as: :dashboard
  resources :sellers, only: [:create]

  resources :sessions, only: [:new, :create]
  get '/log_in' => 'sessions#new', as: :log_in

  root "products#index"
end
