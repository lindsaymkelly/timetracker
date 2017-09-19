Rails.application.routes.draw do
  devise_for :users
  get '/home' => 'pages#index'

  root 'pages#index'
end
