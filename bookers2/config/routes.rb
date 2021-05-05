Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
   get 'home/about' => 'homes#about'
   get 'user/:id/top' => 'users#top', as: 'top'
   get 'user/:id/about' => 'users#about', as: 'about'

  resources :users, only: [:create, :index, :show, :destroy, :edit, :update, :delete]

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update, :delete] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create]
   end

  resources :book_comments, only: [:destroy]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
