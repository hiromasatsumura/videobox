Rails.application.routes.draw do
  devise_for :users
  root  'posts#index'                       #ルートパスを指定
  resources :posts, only: [:index, :new, :create]
  get   'users/:id'   =>  'users#show'      #Mypageへのルーティング
end
