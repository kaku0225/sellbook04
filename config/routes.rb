Rails.application.routes.draw do
  root 'books#index'

  get '/users/sign_up' , to: 'registrations#new', as: 'registration'
  post '/users' , to: 'registrations#create'

  get '/users/sign_in' , to: 'sessions#new', as: 'session'
  post '/login' , to: 'sessions#create', as: 'login'

  deliete 'users/sign_out' , to: 'sessions#destroy', as:'logout'

  resources :books
end
