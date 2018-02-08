Rails.application.routes.draw do

  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

root 'static_pages#home'

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login' to: 'sessions#new'
  post '/login' to: 'sessions#create'
  delete '/logout' to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :events
  get 'event/subscrite/:event/:user', to: 'events#subscibe'

end
