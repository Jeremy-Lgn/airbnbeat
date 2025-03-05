Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: %i[show new create]
end
