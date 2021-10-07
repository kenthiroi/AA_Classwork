Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #User routes
  get '/users/', to: 'users#index', as: 'get_all_users'
  post '/users/', to: 'users#create', as: 'create_user'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#show', as: 'show_user'
  patch '/users/:id', to: 'users#update', as: 'patch_user'
  put '/users/:id', to: 'users#update', as: 'put_user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  #Artwork routes
  resources :artworks
end
