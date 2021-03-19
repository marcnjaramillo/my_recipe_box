Rails.application.routes.draw do
  root to: 'static#home'
  get "/dashboard" => "users#index"
  get "/profile/:username" => "users#profile", as: :profile
  get "/followers" => "followers#index"
  post "follow/user" => "users#follow_user", as: :follow_user

  devise_for :users
  
  resources :recipes do
    resources :comments, module: :recipes
  end
  
  resources :comments do
    resources :comments, module: :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
