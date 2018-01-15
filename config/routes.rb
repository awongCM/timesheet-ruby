Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :user, controllers: {  
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, path_names: {sign_in: "login", sign_out: "logout"}

  # TODOS
  resources :profile
  resources :timesheet
  resources :reporting
  
  root to: 'main#index'
end
