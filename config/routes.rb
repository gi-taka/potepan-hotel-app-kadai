Rails.application.routes.draw do
  get '/', to: 'rooms#index'
  get '/users/sign_up', to: 'users#new'
  get '/users/sign_in', to: 'users#sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations
end
