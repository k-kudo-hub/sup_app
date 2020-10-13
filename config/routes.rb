Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
            registrations: 'users/registrations'
  }
  root to: "rooms#index"
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  resources :clients, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search', to: 'rooms#search_clients'
      resources :details, only: [:edit, :update]
      resources :caregivers, only: [:edit, :update]
      resources :rooms, only: [:index, :new, :create, :edit, :update, :destroy] do
        resources :messages, only: [:index, :create]
      end
      resources :records, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :reports
    end
  end

  get 'details', to: 'clients#new_detail'
  post 'details', to: 'clients#create_detail'
  get '/edit/client', to: 'clients#edit'

  get 'caregivers', to: 'clients#new_caregiver'
  post 'caregivers', to: 'clients#create_caregiver'

  post 'clients/rooms/:id', to: 'rooms#add_user' 
  get 'clients/rooms/:id', to: 'rooms#add_user'

  get '/clients/records/create', to: 'records#bulk_create'
  post '/clients/records/create', to: 'records#bulk_create'

  patch 'client/record', to: 'records#bulk_carry'
  put 'client/record', to: 'records#bulk_carry'

  patch 'client/records/:id', to: 'records#carry_out'

end
