Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # all fighter routes
  resources :fighters do
    # only routes to create update and delete a booking
    resources :bookings, only: %i[show]
  end

  # non-nested booking routes
  resources :bookings, only: %i[create update destroy]

  # profile page route
  get '/profile', to: 'pages#profile'
end
