Rails.application.routes.draw do
  # root 'home#index'
  root 'products#index'

  resources :tags, only: %i[show]
  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]

  devise_for :users

  namespace :admin do
    resources :categories
    resources :products do
      resources :stocks
    end
    resources :tags
    # get '/', to: 'home#index', as: :root
    get '/', to: 'products#index', as: :root
  end

  get '/contact', to: 'home#contact', as: :contact
end
