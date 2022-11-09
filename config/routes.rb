Rails.application.routes.draw do
  # Read All
  root to: 'tasks#index'
  get '/tasks', to: 'tasks#index', as: :tasks

  # Create new
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'tasks#create'

  # Read one
  get '/task/:id', to: 'tasks#show', as: :task

  # Update one
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'task/:id', to: 'tasks#update'

  # Delete one
  delete '/task/:id', to: 'tasks#destroy'
end
