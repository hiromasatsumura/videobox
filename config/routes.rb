Rails.application.routes.draw do
  devise_for :users
  root  'posts#index'                       #ルートパスを指定
  resources :posts, only: [:index, :create, :destroy]
  get   'posts/:id/edit'  => 'posts#edit'
  get   'users/:id'   =>  'users#show'      #Mypageへのルーティング
end
