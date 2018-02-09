Rails.application.routes.draw do
  root 'events#index'

  get 'events/new'

  get 'sessions/new'

  get 'users/new'

  get 'users/show'

  post '/events/:id/invite', to: 'events#invfriend'


  get '/events/:id/invite', to: 'events#invite',as: :invite

  get  '/signup',  to: 'users#new', as: :signup
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new', as: :login
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: :logout

  get '/events/:id/subscribe', to: "events#subscribe", as: :subscribe

  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
