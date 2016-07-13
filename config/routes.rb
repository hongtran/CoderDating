Rails.application.routes.draw do
  post 'sessions/create'

  root 'welcome#index'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  resources :users
  get 'auth/:provider/callback' => 'sessions#callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
