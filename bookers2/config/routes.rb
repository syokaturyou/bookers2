Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
   get 'home/about' => 'homes#about'

  resources :users, only: [:create, :index, :show, :destroy, :edit, :update, :delete]

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update, :delete] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create]
   end

  resources :book_comments, only: [:destroy]
  
end
