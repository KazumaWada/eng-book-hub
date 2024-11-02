Rails.application.routes.draw do
  get 'search/index'
  get 'products/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'home#index'
  root 'products#index'
  get '/about', to: 'home#about'

  get '/blog', to: 'search#index'
end
