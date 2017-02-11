Rails.application.routes.draw do
  resources :user_artigos
  resources :resposta
  resources :pergunta
  resources :artigos
  get 'sessions/new'
  root to: "sessions#new"
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
