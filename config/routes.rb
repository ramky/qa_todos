Rails.application.routes.draw do

  resources :tasks do
    member do
      patch :update_completed
    end
  end
  root to: 'tasks#index'

end
