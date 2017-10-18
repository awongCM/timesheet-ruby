Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :employees

  # TODOS
  resources :profile
  resources :timesheet
  resources :reporting
  
  root to: 'main#index'
end
