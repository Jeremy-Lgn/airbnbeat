Rails.application.routes.draw do
  get 'feedbacks/create'
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: %i[show new create] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show] do
    resources :feedbacks, only: %i[new create]
  end

  get 'my_instruments', to: "pages#my_instruments"# Ajout de la route pour l'action my_instruments
end
