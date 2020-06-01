Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  delete 'sessions/destroy', to: 'sessions#destroy'
  # get 'sessions/destroy', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :events, only: %i[index show new create]
  post 'events/:id/attendences', to: 'attendences#create', as: 'attendence'

  root 'events#index'
end
