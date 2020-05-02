Rails.application.routes.draw do
  resources :payments
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/calculator', to: 'home#calculator'
  get '/my-payments', to: 'home#my_payments'

  root to: 'home#index', as: :homepage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
