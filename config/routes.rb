Rails.application.routes.draw do
  devise_for :users
  root to: "application#index"
  post 'add_project', to: "employees#add"
  post 'remove_employee', to: "employees#remove"
  resources :divisions
  resources :employees
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
