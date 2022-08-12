Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  get 'sobre', to: "static_pages#sobre"
  get 'contato', to: "static_pages#contato"
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :contacts
  resources :users, only: [:new, :create]
  

end
