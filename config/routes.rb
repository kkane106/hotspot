Rails.application.routes.draw do
  get 'search/index'

  get 'search/show'

  resources :users
  resources :repositories, except: [:edit, :update] do
    resources :commits, only: [:show, :index]
  end
  resources :docs

  root "users#index"

  get '/search', :to => 'repositories#search'

  # Github Callback
  get '/auth/github/callback', to: 'sessions#create'
  # Logout
  get '/sessions/destroy', to: 'sessions#destroy', as: :logout

end
