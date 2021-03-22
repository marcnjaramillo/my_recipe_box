Rails.application.routes.draw do
  root to: 'static#home'
  get "/dashboard" => "users#index"
  get "/profile/:username" => "users#profile", as: :profile

  devise_for :users, :path => 'account'

  resources :users, param: :username do
    member do
      get :following, :followers
    end
  end
  
  resources :recipes do
    resources :comments, module: :recipes
  end
  
  resources :comments do
    resources :comments, module: :comments
  end

  resources :relationships, only: [:create, :destroy]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
