Rails.application.routes.draw do
  resources :comments, only: [:edit, :destroy]
  resources :ingredients
  resources :stories
  resources :recipes
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'
  post '/recipes/add_ingredients', to: 'recipes#add_ingredient', as: 'add_ingredient'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
