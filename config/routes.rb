Rails.application.routes.draw do
  root 'users#show'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
  get 'users/display_time'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attendances, only: [:index, :edit, :update]

  resources :users do
    resources :attendances, only: [:create, :destroy]
  end
end
