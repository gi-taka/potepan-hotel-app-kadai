Rails.application.routes.draw do
  get '/', to: 'rooms#index'
  get '/users/sign_up', to: 'users#sign_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations
end
