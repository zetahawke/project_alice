Rails.application.routes.draw do
  root 'products#index'

  resources :tags, only: %i[show]
  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]

  devise_for :users

  namespace :admin do
    resource :categories
    resource :products do
      resource :stocks
    end
    resource :tags
    get '/', to: 'home#index', as: :root
  end

  get '/contact', to: 'home#contact', as: :contact
end
