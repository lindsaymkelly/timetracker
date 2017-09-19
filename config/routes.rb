Rails.application.routes.draw do
  devise_for :users
  get '/home' => 'pages#index'
  resources :customers
  resources :projects
  resources :tasks
  resources :task_entries

  post '/task_entries/stop_timer' => 'task_entries#stop_timer'

  root 'pages#index'
end
