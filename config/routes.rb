Rails.application.routes.draw do
  # User Authentication Routes
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Basic Hotel Routes
  resources :hotels do
    resources :reviews, only: [:new, :create]
    resources :room_types, only: [:index, :show]
    resources :bookings, only: [:new, :create, :show]
  end

  # Booking Routes
  resources :bookings, only: [:new, :create, :show, :index]

  # Admin Namespace
  namespace :admin do
    # Admin Dashboard
    get '/', to: 'dashboard#index', as: :dashboard

    # Admin Hotel Management
    resources :hotels do
      resources :room_types, only: [:new, :create, :edit, :update, :destroy]
    end

    # Admin Booking Management
    resources :bookings, only: [:index, :show, :destroy] do
      member do
        patch :cancel
      end
    end

    # Admin User Management
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  # Define root route
  root 'hotels#index'
end
