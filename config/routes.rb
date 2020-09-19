Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :clients, only: [:new, :create] do
  end
  get 'details', to: 'clients#new_detail'
  post 'details', to: 'clients#create_detail'
  get 'caregivers', to: 'clients#new_caregiver'
  post 'caregivers', to: 'clients#create_caregiver'

end
