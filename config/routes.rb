Rails.application.routes.draw do

  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

root 'static_pages#home'

  resources :users
  resources :sessions
  get 'event/subscrite/:event/:user', to: 'events#subscibe'

end
