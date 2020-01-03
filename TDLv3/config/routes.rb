Rails.application.routes.draw do
  resources :taggings
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    root 'entries#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :entries do
      put '/toggle_done', to: 'entries#toggle_done'
    end
    resources :tags
  end

  get 'tags/:tag', to: 'posts#index', as: :tag
  
end
