Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :create, :destroy] do
    member do
      get :likes
    end
  end
  resources :recipes, only:[:show, :new, :create, :update, :edit, :destroy]
  
  resources :favorites, only: [:create, :destroy]
end
