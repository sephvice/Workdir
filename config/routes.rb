Rails.application.routes.draw do
  resources :posts
  resources :comnpanies
  devise_for :staffs
  resources :feeds do
    resources :comments
  end
  resources :staffs
  resources :books
  resources :teams

  # resources :user_dashboards
  # resources :users
  #devise_for :views
  devise_for :models
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'staffs#index'
  get 'staffs/index'
  get 'feeds/index'
  get 'feeds/new'
  get 'feeds/create'
  get 'feeds/:id/comments/:id', to: 'comments#update', as: 'comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
