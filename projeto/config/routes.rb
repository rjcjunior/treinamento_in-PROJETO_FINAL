Rails.application.routes.draw do
  resources :votos_artigos
  resources :votos_posts
  resources :posts
  mount Ckeditor::Engine => '/ckeditor'
  get 'password_resets/new'

  get 'password_resets/edit'
      
  resources :user_artigos
  resources :artigos
  get 'sessions/new'
  root to: "sessions#new"
  get '/home', to: 'pages#index'
  get '/pesquisa', to: 'pages#pesquisa'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/votar', to: 'votos_artigos#create'
  post '/responder', to: 'posts#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
