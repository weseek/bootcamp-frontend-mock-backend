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

  defaults format: :json do
    resources :sprints do
      resources :swimlanes, only: %w[create]
    end
    resources :swimlanes do
      resources :tasks, only: %w[create]
    end
    resources :tasks, only: %w[index show update destroy]
  end
end
