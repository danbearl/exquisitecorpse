Exquisitecorpse::Application.routes.draw do
  get 'log_in' => 'user_sessions#new', as: 'log_in'
  get 'log_out' => 'user_sessions#destroy', as: 'log_out'
  get 'morgue' => 'corpses#morgue', as: 'morgue'
  get 'add_friend' => 'users#add_friend', as: 'add_friend'
  get 'remove_friend' => 'users#remove_friend', as: 'remove_friend'

  root to: 'pages#index'

  resources :users, only: [:new, :create] do
    resource :profile
  end

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :snippets
  resources :profiles
  resources :likes
  resources :notifications

  resources :corpses do
    resources :snippets
  end
end
