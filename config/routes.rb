Rails.application.routes.draw do
  # get "users/show"
  # get "borrowings/create"
  # get "borrowings/destroy"
  # get "books/index"
  # get "books/show"
  # get "books/new"
  # get "books/create"
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "books#index"

  # Devise routes for user authentication
  devise_for :users

  # User profile route
  get "/profile", to: "users#show", as: "profile"

  # Books routes (index, show, new, create) with nested borrowings (for borrowing a book)
  resources :books, only: [:index, :show, :new, :create] do
  resources :borrowings, only: [:create]
  end

  # Borrowings route to return a book
  resources :borrowings, only: [:destroy]
end
