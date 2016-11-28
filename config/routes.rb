Rails.application.routes.draw do
 
 	resources :listings 
<<<<<<< HEAD
  resources :users, only: [:index, :show, :team]
  resources :reservations
=======
  resources :users, only: [:index, :show]
>>>>>>> master
  resources :profiles 


  get 'home' => 'home#index' #when someone types /home, it will lead to home/index
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
