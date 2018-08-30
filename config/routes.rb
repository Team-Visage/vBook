Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :profile
  get '/', to: 'posts#index'
  root to: 'posts#index'
end
