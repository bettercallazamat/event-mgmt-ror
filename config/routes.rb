Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :events, only: %i[index show new create]

  root "events#index"
end
