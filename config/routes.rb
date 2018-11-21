Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/baseworkweek', to: 'availabilities#index'
  get '/design', to: 'pages#design'
  patch '/baseworkweek/:id', to: 'availabilities#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
