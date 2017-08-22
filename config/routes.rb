Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'whatisit', to: 'welcome#help'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :measurements, except: [:new, :edit, :update]
  resources :bmi_ranges
  resources :users, except: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
