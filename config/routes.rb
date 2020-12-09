Rails.application.routes.draw do
  get 'pages/search'

  get '/search' => 'pages#search', :as => 'search_page'
  get 'home/index'
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup',to: 'users#new', as: 'signup'  
  get 'login',to:'sessions#new', as: 'login'  
  get 'logout',to:'sessions#destroy',as: 'logout'  
  resources :users
   
  get 'home/index'  
  root 'home#index' 
  resources :users do
     resources :tasks
  end
end
