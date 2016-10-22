Rails.application.routes.draw do
  resources :relearnables
  root to: 'relearnables#index'
  devise_for :users
  resources :users
end
