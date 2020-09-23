Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :clients, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      resources :details, only: [:edit, :update]
      resources :caregivers, only: [:edit, :update]
      resources :rooms, only: [:index, :new, :create, :edit, :update, :destroy] do
        resources :messages, only: [:index, :create]
      end
    end
  end

  get 'details', to: 'clients#new_detail'
  post 'details', to: 'clients#create_detail'
  get '/edit/client', to: 'clients#edit'

  get 'caregivers', to: 'clients#new_caregiver'
  post 'caregivers', to: 'clients#create_caregiver'

  post 'clients/rooms/:id', to: 'rooms#add_user' 

end
