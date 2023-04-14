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
    resources :items,  only: [:index, :show]
    resources :customers  , only: [:show, :edit, :update]
    get 'customers/:id/is_deleted' => 'public/customers#confirm_deleted'
    patch 'customers/:id/is_deleted' => 'public/customers#is_deleted'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete 'cart_items' => 'public/cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm' => 'public/orders#confirm'
    get 'orders/finish' => 'public/orders#finish'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:edit, :update]
    resources :order_items, only: [:edit, :update]
    root  :to => 'admin/homes#top'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
