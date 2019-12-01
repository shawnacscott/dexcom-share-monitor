Rails.application.routes.draw do
  root to: 'pings#show'

  namespace :facebook do
    resources :posts, only: [ :create ]
  end
end
