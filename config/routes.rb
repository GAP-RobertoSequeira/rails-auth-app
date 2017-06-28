Rails.application.routes.draw do

  resources :apps do
    resources :roles
  end

  devise_for(
    :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',

      registration: 'a',
      sign_up: 'register',
    }
  )

  namespace :api, defaults: {format: :json} do
    post 'login', to: 'sessions#create'
    resources :users, only: [:index, :show]
  end

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/roles/:id', to: 'dashboard#roles', as: :user_roles
  post 'dashboard/roles/:id', to: 'dashboard#update'

  get 'jwt', to: 'home#jwt'
  root 'home#index'

end
