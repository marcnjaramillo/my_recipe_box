Rails.application.routes.draw do
  root to: 'static#home'
  get '/profile/:id', to: 'static#profile', as: "profile"
  devise_for :users
  
  resources :recipes do
    resources :comments, module: :recipes
  end
  
  resources :comments do
    resources :comments, module: :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
