Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/repositories', to: 'repositories#index'
  get '/followers', to: 'followers#index'
  get '/new_repository', to: 'repositories#new'
  get '/following', to: "followings#index"
  delete '/logout', to: 'sessions#destroy'
end
