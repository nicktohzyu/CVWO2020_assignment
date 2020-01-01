Rails.application.routes.draw do
  resources :entries do
    resources :tags
    put '/set_done', to: 'entries#set_done'
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'entries#index'

end
