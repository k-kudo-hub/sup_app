Rails.application.routes.draw do
  devise_for :user
  root to: "rooms#index"
  resources :rooms, only: [:index]
end
