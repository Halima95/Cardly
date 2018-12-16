Rails.application.routes.draw do
  # get 'pages/home'
  # get 'events/show'
  # get 'events/new'
  # get 'events/edit'
  # get 'events/delete'
  devise_for :users
  resources :users, only: [:show]
  resources :events
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
