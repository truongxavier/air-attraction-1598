Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :parks do
    resources :rentals, only: [:create]

  end
  resources :rentals, only: [] do
    resources :park_reviews, only: [:create, :new]
  end
  patch '/rentals/:id', to: "rentals#accept", as: :accept_rental
  patch '/rentals/:id', to: "rentals#decline", as: :decline_rental
end
