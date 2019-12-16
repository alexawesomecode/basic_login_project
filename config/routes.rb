Rails.application.routes.draw do
  get 'static_pages/new'
  get 'static_pages/home'
  get 'sessions/new'
  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update, :show, :index]
end
