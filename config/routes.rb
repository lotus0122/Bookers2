Rails.application.routes.draw do

  root 'books#top'

  get "books/new" => "books#new"
  # 追加
  get "users/books" => "books#index"
  get "login" => "users#login_form"
  get "signup" => "users#signup_form"
  post "users/create" => "users#create"

  resources :books

  devise_for :users
  

  patch 'books/:id' => 'books#update', as: 'update_post'

  delete 'books/:id' => 'books#destroy' , as:'destroy_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users/:id" => "users#show"
  get "books/:id" => "books#show"

  root 'books#index'
  root 'post_images#index'
  root 'users#index'

  resources :users

  resources :post_images, only: [:new, :create, :index, :show]


end