Rails.application.routes.draw do
  root to: "results#new" 
  resources :results, only: [:create, :new, :show]
  devise_for :users
  resources :users, except: [:index]

  resources :composts do
    resources :pictures, only: [:create]
    resources :contributions, only: [:create, :update, :new]
    resources :timeslots, only: [:create, :destroy]
  end
  resources :conversations, only: [:create] do
    resources :messages, only: [:create, :index]
  end
end
