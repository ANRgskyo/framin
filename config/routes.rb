Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  # admin/
  namespace :admin do
     # orders
    get 'order/index', to:'orders#index'
    patch 'order/index', to: 'orders#update'
    get 'order/:id', to: 'orders#show'
    patch 'order/:id', to: 'orders#co_update'
     # payments
    get 'payment', to: 'payments#index'
    patch 'payment', to: 'payments#update'
  end

  # admins
  get '/admin', to: 'admins#index',as: :admin_index

  # search
  get '/search', to: 'searchs#index',as: :search_index

  # shopping_cart/
  namespace :shopping_cart do
     # cart_orders
    get ':id/order', to: 'cart_orders#show'
    post ':id/order', to: 'cart_orders#order'
     # carts
    get ':id', to: 'carts#index', as: :shopping_cart
    delete ':id/:cart_work_id', to: 'carts#destroy', as: :shopping_work
    post ':id/:cart_work_id', to: 'carts#update', as: :update
    patch ':id/:cart_work_id', to: 'carts#pass', as: :pass
  end

  # user/
  namespace :user do
    # follows
    get ':id/followed/index', to: 'follows#fed_index', as: :followed
    get ':id/follower/index', to: 'follows#fer_index', as: :follower
  end

  # history/
  namespace :history do
    get 'order', to: 'orders#index_order'
    get ':order_id/:id', to: 'orders#show_order', as: :order_show
    get 'sale', to: 'orders#index_sale'
    get 'sale/:id', to: 'orders#show_sale', as: :sale_show
  end

  #  config/
  namespace :config do
    resources :credits, only: [:edit, :update]
      # credits
    get 'credit/new', to: 'credits#credit_new'
    post 'credit', to: 'credits#credit_create', as: :credit_create
    delete 'credit/:id', to: 'credits#credit_destroy'
      # banks
    get 'bank/new', to: 'banks#bank_new'
    post 'bank', to: 'banks#bank_create'
  end
  get 'config', to: 'configs#index', as: :config_index
  delete 'config', to: 'configs#bank_destroy', as: :config_bank_destroy

  # work/
  namespace :work do
    post ':id/favorite', to: 'favorites#create', as: :favorite_new
    delete ':id/favorite', to: 'favorites#destroy', as: :favorite_delete
  end


  #  works
  resources :works, only: [:show, :edit, :new, :create, :update, :destroy]
     # ユーザの作品表示
  get 'user/:id/work', to: 'works#index', as: :my_work
     # カートに追加する作品
  post 'work/:id', to: 'works#add', as: :in_cart_work
     # フォローした作品を表示
  get 'work', to: 'works#collect_index', as: :follower_work


  # users
  resources :users, only: [:show, :edit, :destroy, :update]
     # user/cancel
  get 'user/:id/cancel', to: 'users#show_cancel', as: :cancel_user
  post 'user/:id/cancel', to: 'users#update_cancel'
     # user/follow
  post 'user/:id/follow', to: 'users#add', as: :follow_user
  delete 'user/:id/follow', to: 'users#follow_destroy'

  # top
  root to: 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
