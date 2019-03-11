Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  get 'places/create'
  get 'places/destroy'
  get 'places/index'
  
  resources :places do
    resources :comments
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
