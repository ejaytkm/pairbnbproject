Rails.application.routes.draw do
 
 	resources :listings
  # do
  resources :reservations, only: [:new] do 
    resources :checkout, only: [:new]
  end
  # end

  resources :users, only: [:index, :show, :team]
  get 'basket', to: 'reservations#basket'
  post 'checkout', to: 'reservations#checkout'
  get 'summary', to: 'reservations#summary'
  resources :reservations

  resources :users, only: [:index, :show]

  resources :profiles 

  get 'home' => 'home#index' #when someone types /home, it will lead to home/index
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
