Rails.application.routes.draw do
  root to: "results#new" 
  resources :results, only: [:create, :new, :show]
  devise_for :users
  resources :users
  resources :composts
  resources :contributions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
