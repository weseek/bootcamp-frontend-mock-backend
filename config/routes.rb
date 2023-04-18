Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :tasks
      resources :swimlanes
      resources :sprints

      root to: "sprints#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
