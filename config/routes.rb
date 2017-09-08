Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts do
    resources :comments
  end
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
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/:id/comments/:id', to: 'comments#update', as: 'comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
