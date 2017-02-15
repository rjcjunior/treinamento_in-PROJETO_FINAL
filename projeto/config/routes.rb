Rails.application.routes.draw do
  resources :user_posts
  resources :votos_artigos
  resources :votos_posts
  resources :posts
  mount Ckeditor::Engine => '/ckeditor'
      
  resources :user_artigos
  resources :artigos
  get 'sessions/new'
  root to: "sessions#new"
  get '/home', to: 'pages#index'
  get '/pesquisa', to: 'pages#pesquisa'
  get '/estatisticas', to: 'pages#estatisticas'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/votar_artigo', to: 'artigos#votar'
  get '/votar_post', to: 'posts#votar'
  get '/email', to: 'pages#email'
  get '/pergunta', to: 'users#pergunta'
  post '/responder', to: 'posts#create'
  post '/alterarvoto', to: 'votos_artigos#update'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
