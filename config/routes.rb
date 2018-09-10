Rails.application.routes.draw do
  root 'users#show'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attendances, only: [:index]

  resources :users do
    resources :attendances, only: [:create, :update, :destroy]
  end
end
