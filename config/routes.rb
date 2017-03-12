Rails.application.routes.draw do

  root 'dealerships#index'
  resources :dealerships
  resources :cars
  resources :salesmen
  resources :customers
end
