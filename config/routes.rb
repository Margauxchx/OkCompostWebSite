Rails.application.routes.draw do
  root to: "results#new" 
  resources :results, only: [:create, :new, :show]
  devise_for :users
  resources :users
  resources :composts do
    resources :pictures, only: [:create]
  end
  resources :contributions do
    post 'accept'
    post 'reject'
  end 
  root to: "composts#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
