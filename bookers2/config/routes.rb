Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
   get 'home/about' => 'homes#about'

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update, :delete]

  resources :users, only: [:create, :index, :show, :destroy, :edit, :update, :delete]

end
