Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :clients, only: [:new, :create] do
    resources :details
  end

end
