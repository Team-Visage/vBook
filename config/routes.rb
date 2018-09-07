Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'posts/:id/edit', to: 'posts#edit', as: :edit_post


  resources :posts do
    resources :comments
  end
  resources :profile
  resources :like
  get '/', to: 'home#index'
end


#cascade delete
