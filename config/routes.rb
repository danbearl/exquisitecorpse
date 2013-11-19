Exquisitecorpse::Application.routes.draw do
  get 'log_in' => 'user_sessions#new', as: 'log_in'
  get 'log_out' => 'user_sessions#destroy', as: 'log_out'
  get 'morgue' => 'corpses#morgue', as: 'morgue'
  get 'add_friend' => 'users#add_friend', as: 'add_friend'
  get 'remove_friend' => 'users#remove_friend', as: 'remove_friend'
  get 'change_password' => 'users#change_password', as: 'change_password'
  post 'change_password' => 'users#update_password', as: 'update_password'

  root to: 'pages#index'

  resources :users do
    resource :profile
  end

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :snippets
  resources :profiles
  resources :likes
  resources :notifications
  resources :posts

  resources :corpses do
    resources :snippets
    resources :comments
  end
end
