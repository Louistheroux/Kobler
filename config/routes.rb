Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/baseworkweek', to: 'availabilities#index'
  get '/design', to: 'pages#design'
  patch '/baseworkweek/:id', to: 'availabilities#update'
  get '/bookings', to: 'bookings#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :availabilities, only: [ :index ]
    end
  end
end
