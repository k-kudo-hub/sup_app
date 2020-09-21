Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :clients, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      resources :details, only: [:edit, :update, :destroy]
      resources :caregivers, only: [:edit, :update, :destroy]
    end
    resources :room
  end

  get 'details', to: 'clients#new_detail'
  post 'details', to: 'clients#create_detail'
  get '/edit/client', to: 'clients#edit'

  get 'caregivers', to: 'clients#new_caregiver'
  post 'caregivers', to: 'clients#create_caregiver'

end
