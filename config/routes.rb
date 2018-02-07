Rails.application.routes.draw do

  resources :users
  resources :sessions

  root 'static_pages#home'

  get '/signup',    to: 'users#new'
  post '/login',    to: 'users#create'
  get 'show',       to: 'users#show'
  get '/index',     to: 'users#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
