Rails.application.routes.draw do
  get 'users/sign_in', to: 'users#sign_in'
  get 'users/sign_up', to: 'users#new'
  post 'users/login', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations
  root 'rooms#index'
end
