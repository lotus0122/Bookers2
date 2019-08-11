Rails.application.routes.draw do

  root 'books#top'

  get "books/new" => "books#new"
  get "login" => "users#login_form"

  resources :books

  devise_for :users
  

  patch 'books/:id' => 'books#update', as: 'update_post'

  delete 'books/:id' => 'books#destroy' , as:'destroy_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#index'

  resources :users

  resources :post_images, only: [:new, :create, :index, :show]


end