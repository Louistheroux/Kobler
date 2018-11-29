Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'dashboard#index'
  get '/baseworkweek', to: 'availabilities#index'
  get '/design', to: 'pages#design'
  patch '/baseworkweek/:id', to: 'availabilities#update'
  get '/baseworkweek', to: 'availabilities#index'
  post '/baseworkweek', to: 'api/v1/availabilities#create'
  get '/bookings', to: 'bookings#index'
  post '/bookings', to: 'api/v1/bookings#create'

  resources :personal_tours, only: [ :new, :create ]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :availabilities, only: [ :index, :update, :destroy ]
      resources :bookings, only: [ :index, :update, :destroy ]
    end
  end
end

