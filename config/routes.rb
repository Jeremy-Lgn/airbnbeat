Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: %i[show new create] do
    resources :bookings, only: %i(new create)
  end
  resources :bookings, only: %i(index show)
end
