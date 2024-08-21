Rails.application.routes.draw do
  resources :programs

  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # Psychologists routes
  devise_for :psychologists, path: 'psychologists', controllers: {
    sessions: 'psychologists/sessions',
    registrations: 'psychologists/registrations',
    passwords: 'psychologists/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get 'programs/show' => 'programs#show'
end
