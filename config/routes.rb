Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets
  root to: 'pets#home'
  # get 'pets', to: 'pets#index'
  # get 'pets/:id', to: 'pets#show', as: 'pet'
end
