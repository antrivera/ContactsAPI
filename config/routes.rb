Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :contact_shares, only: [:create, :destroy]
  resources :users do
    resources :contacts, only: :index
  end
  # get 'users/', to: 'users#index'
  # post 'users/', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'users_new'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
end
