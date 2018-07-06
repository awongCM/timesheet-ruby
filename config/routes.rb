Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :user, controllers: {  
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, path_names: {sign_in: "login", sign_out: "logout"}

  # TODOS - to scale and refine
  resources :profile
  resources :timesheet
  resources :reporting
  resources :help, only: [:index]
  
  root to: 'main#index'

  # Catch-all to allow proper HTTP responses for 404, 403 and 505 errors
  get "*route_not_found.:format", :to => "application#route_not_found"
  get "*route_not_found",         :to => "application#route_not_found"
end
