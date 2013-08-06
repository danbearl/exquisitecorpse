Exquisitecorpse::Application.routes.draw do
  get 'log_in' => 'user_sessions#new', as: 'log_in'

  root to: 'pages#index'
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :snippets
  resources :corpses do
    resources :snippets
  end
end
