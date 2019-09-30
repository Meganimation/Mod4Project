Rails.application.routes.draw do
  resources :stores
  resources :games
 resources :currencies

  root 'currencies#index'
  post 'calculate', to: 'currencies#calculate'
  post 'search', to: 'currencies#search'

  post 'searchz', to: 'games#searchz'
  





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
