Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cleans/sindan' => 'cleans#sindan'
  get 'cleans/kensaku' => 'cleans#kensaku'
  get 'users/show/iine/:id', to: 'users#iine'
  get 'cleans/gaiyou' => 'cleans#gaiyou'

  resources :cleans do

    post 'kensaku', on: :collection
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  
  resources :users, only: [:show, :iine]
  root 'cleans#index'
end
