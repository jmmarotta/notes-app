Rails.application.routes.draw do
  resources :notes, except: %i[ show new edit ]
  devise_for :users
  root 'notes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
