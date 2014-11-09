	Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, only: [:show]
  resources :repositories, except: [:edit, :update]
  resources :notes, only: [:new, :create]


  root "welcome#index"

  get '/search', :to => 'repositories#index'

  get '/code-review', :to => 'repositories#show'


  # Github Callback
  get '/auth/github/callback', to: 'sessions#create'
  # Logout
  get '/sessions/destroy', to: 'sessions#destroy', as: :logout

end
