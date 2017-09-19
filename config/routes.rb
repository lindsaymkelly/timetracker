Rails.application.routes.draw do
  devise_for :users
  get '/home' => 'pages#index'
  resources :customers
  resources :projects
  resources :tasks
  resources :task_entries

  root 'pages#index'
end
