Rails.application.routes.draw do
  devise_for :users
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'

  root to: 'home#index', as: :homepage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
