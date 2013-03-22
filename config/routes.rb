Exquisitecorpse::Application.routes.draw do
  root to: 'pages#index'
  resources :users, only: [:new, :create]
end
