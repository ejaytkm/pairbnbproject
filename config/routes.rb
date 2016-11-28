Rails.application.routes.draw do
 
 	resources :listings 
  resources :users, only: [:index, :show, :team]
  resources :profiles 

  get 'home' => 'home#index' #when someone types /home, it will lead to home/index
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
