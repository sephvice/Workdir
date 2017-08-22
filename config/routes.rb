Rails.application.routes.draw do
  devise_for :staffs
  resources :feeds
  resources :staffs
  resources :books
  get 'post/new'

  get 'post/create'

  resources :user_dashboards
  resources :users
  #devise_for :views
  devise_for :models
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  get 'user/index'
  get 'post/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
