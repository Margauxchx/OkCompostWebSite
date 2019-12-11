Rails.application.routes.draw do
  root to: "results#new" 
  resources :results, only: [:create, :new, :show]
  devise_for :users
  resources :users

  resources :composts do
    resources :pictures, only: [:create]
    resources :contributions, only: [:create, :update, :new]
  end
  resources :conversations do
    resources :messages
  end
end
