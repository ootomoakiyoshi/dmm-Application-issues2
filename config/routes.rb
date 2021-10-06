Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get 'followings/:id' => 'relationships#followings', as: 'followings'
  get 'followers/:id' => 'relationships#followers', as: 'followers'
  get '/search', to: 'searchs#search'

 end