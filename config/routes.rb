Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: %i(show new create) do
    resources :bookings, only: %i(create)
  end
  resources :bookings, only: %i(index)

  get 'my_instruments', to: "pages#my_instruments" # Ajout de la route pour l'action my_instruments

end
