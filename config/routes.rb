Rails.application.routes.draw do
  resources :comments, only: [:edit, :destroy, :create, :update, :destroy]
  resources :ingredients
  resources :stories
  resources :recipes
  resources :users

  get '/login', to: 'sessions#new', as: 'login'

  post '/sessions', to: 'sessions#create', as: 'sessions'

  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  post '/ingredients/add_ingredient', to: 'ingredients#add_ingredient', as: 'add_ingredient'

  get '/signup', to: 'users#new', as: 'signup'

  patch '/recipes/add_recipe', to: 'recipes#add_recipe', as: 'add_recipe'

  get '/', to: 'static#index', as: 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
