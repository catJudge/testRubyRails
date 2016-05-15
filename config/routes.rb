Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :blogs do
    resources :posts
  end

  root to: 'blogs#index'

end
