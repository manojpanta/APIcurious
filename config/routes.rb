Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/repositories', to: 'repositories#index'
  delete '/logout', to: 'sessions#destroy'
end
