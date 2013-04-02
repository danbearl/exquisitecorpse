Exquisitecorpse::Application.routes.draw do
  root to: 'pages#index'
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
end
