Rails.application.routes.draw do

  devise_for :users
  root to: 'application#index'

  get '/posts', to: 'posts#index'

end
