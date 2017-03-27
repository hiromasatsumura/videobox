Rails.application.routes.draw do
  devise_for :users
  root  'posts#index'                       #ルートパスを指定
  resources :posts, only: [:index, :create, :destroy, :edit, :update, :show] do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
