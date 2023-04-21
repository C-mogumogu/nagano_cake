Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'items/index/:genre_id', to: 'items#genre_search', as: 'genre_search'
    resources :items,  only: [:index, :show]do
      collection do
        get '/search', to: 'items#search'
      end
    end
    get 'customer/confirm_deleted' => 'customers#confirm_deleted' #/public削除
    patch 'customer/is_deleted' => 'customers#is_deleted' #/public削除
    resource :customer  , only: [:show, :edit, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all' #public削除
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get 'orders/finish' => 'orders#finish' #/public削除
    post 'orders/confirm' => 'orders#confirm' #/public削除
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :order_items, only: [:create]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    get 'orders/:id/customer_orders' => 'orders#customer_orders' #顧客ごとの注文一覧
    resources :orders, only: [:show, :update, :index]
    resources :order_items, only: [:update]
    root  :to => 'homes#top' #admin削除
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
