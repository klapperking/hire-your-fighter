Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # all fighter routes
  resources :fighters do
    # only routes to create update and delete a booking
    resources :bookings, only: %i[show create]
  end

  # non-nested booking routes
  resources :bookings, only: %i[new create update destroy]

  # profile page routes
  get '/profile', to: 'pages#profile'
  get '/profile/my_fighters', to: 'pages#my_fighters', as: :my_fighters
  get '/profile/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  get '/profile/dashboard', to: 'pages#dashboard', as: :dashboard
end
