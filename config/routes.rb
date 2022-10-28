Rails.application.routes.draw do
  root 'tasks#index'
  get '/users/edit', to: 'users#edit', as: :profil
  #get '/profil', to: 'users#show', as: :show_profil
  patch '/users/edit', to: 'users#update'
  resources :tasks
  resources :users
  #get '/users/show', to: 'users#show', as: :users
  delete '/sessions/new', to: 'users#destroy', as: :destroy_user
  #session
  get '/sessions/new', to: 'sessions#new', as: :new_session
  post '/sessions/new', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy', as: :destroy_session
end
