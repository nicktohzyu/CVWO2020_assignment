Rails.application.routes.draw do
  resources :tags
  resources :entries
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'entries#index'
end
