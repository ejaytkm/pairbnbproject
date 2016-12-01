Rails.application.routes.draw do
 
  resources :listings
  resources :listing do 
    resources :reservations, only: [:new, :create] do 
      resources :basket, only: [:new, :create]
      end
    end
  end


  resources :users, only: [:index, :show, :team]
  resources :profiles 

  get 'home' => 'home#index' #when someone types /home, it will lead to home/index
  root 'home#index'

  get 'summary', to: 'reservations#summary'
end
