Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create] do
    resources :subs, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: [:create]
end
