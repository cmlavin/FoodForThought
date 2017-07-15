Rails.application.routes.draw do
  resources :comments, only: [:edit, :destroy, :create, :update, :destroy]
  resources :ingredients
  resources :stories
  post '/recipes/add_recipe', to: 'recipes#add_recipe', as: 'add_recipe'
    get '/recipes/search', to: 'recipes#search', as: "search_recipes"
  resources :recipes
  resources :users
  resources :recipes do
    put :favorite, on: :member
  end
  resources :stories do
    put :favorite, on: :member
  end

  get '/login', to: 'sessions#new', as: 'login'

  post '/sessions', to: 'sessions#create', as: 'sessions'

  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  post '/ingredients/add_ingredient', to: 'ingredients#add_ingredient', as: 'add_ingredient'

  get '/signup', to: 'users#new', as: 'signup'

  get '/', to: 'static#index', as: 'home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
