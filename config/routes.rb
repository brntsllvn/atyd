Rails.application.routes.draw do

  root 'comics#index'
  
  resources :comics, except: [:show]

  get "/pages/:page" => "pages#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy] 
  resources :comments, only: [:create, :destroy]

  get 'angular_test', to: 'angular_test#index'

end
