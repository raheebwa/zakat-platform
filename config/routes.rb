Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :payments
    resources :mosques

    root to: "users#index"
  end
  resources :payments
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/calculator', to: 'home#calculator'
  get '/my-payments', to: 'home#my_payments'
  post '/pay-zakat', to: 'home#pay_zakat'
  delete "/my-payments/:id", to: "home#destroy_payment", as: :zakat_payment_path

  root to: 'home#index', as: :root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
