Rails.application.routes.draw do
  resources :tags
  resources :stocks
  resources :products
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :admin do
    # resource :products
    get '/', to: 'home#index', as: :root
  end
end
