Rails.application.routes.draw do

  root 'comics#index'
  
  resources :comics, except: :show do
    member do
      post 'vote'
    end
  end
  
  get "/pages/:page" => "pages#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  post '/subscriptions/subscribe', to: 'subscriptions#subscribe'

  resources :sessions, only: [:create, :destroy] 
  resources :comments, only: [:create, :destroy]

end
