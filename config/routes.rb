Rails.application.routes.draw do
  resources :results
  devise_for :users
  resources :users
  resources :composts
  resources :contributions
  root to: "composts#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
