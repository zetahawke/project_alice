Rails.application.routes.draw do
  root 'home#index'

  resources :tags
  resources :stocks
  resources :products
  resources :categories
  devise_for :users

  namespace :admin do
    resource :categories
    resource :products do
      resource :stocks
    end
    resource :tags
    get '/', to: 'home#index', as: :root
  end
end
