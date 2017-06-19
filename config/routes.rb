Rails.application.routes.draw do

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
    resources :users, only: [:index, :show]
  end

  get 'dashboard', to: 'dashboard#index'
  root 'home#index'

end
