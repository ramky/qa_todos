Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create]
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :tasks do
    member do
      patch :update_completed
    end
  end
  root to: 'tasks#index'
end
