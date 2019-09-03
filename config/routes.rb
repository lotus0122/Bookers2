Rails.application.routes.draw do

  root 'books#top'


  resources :books

  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  get '/home/about' => 'books#about'

end