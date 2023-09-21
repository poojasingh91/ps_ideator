Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "ideas#index"
  resources :ideas
  get 'about'=> 'static_pages#about'
  get 'random'=> 'static_pages#random'

end
