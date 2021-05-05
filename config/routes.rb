Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [] do
    member do
      put :check_in
      put :check_out
    end
  end
  resources :clock_events, only: %i(edit update)
end
