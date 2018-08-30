Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  post '/like', to: 'posts_controller#like', as: 'button'
  get '/', to: 'home#index'
  root to: 'home#index'
end
