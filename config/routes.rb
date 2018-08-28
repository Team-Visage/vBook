Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :users, :home
  get '/', to: 'home#index'

end
