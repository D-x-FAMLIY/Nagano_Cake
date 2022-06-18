Rails.application.routes.draw do

  #adminログイン画面をトップページに設定
  # devise_scope :admin do
    # root to: "admin/sessions#new"
  # end

  # get 'public/homes/about' => 'homes#about', as: 'about'

  namespace :admin do
    get 'homes/top'
  end

  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    resources :products
    #get 'products/index'
    #get 'products/new'
    # create追加
    #get 'products/create'
    #get 'products/show'
    #get 'products/edit'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
  end

  namespace :admin do
    #genresのnew,showを除くルーティング自動生成
    resources :genres, except: [:new, :show]
  end

  namespace :public do
    resources :address, except: [:show]
    #get 'addresses/index'
    #get 'addresses/edit'
  end

  namespace :public do
    resources :customers, except: [:index]
    patch 'customers/decline'
    post 'customers/confirm'
    #get 'customers/show'
    #get 'customers/edit'
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  namespace :public do
    get 'products/index'
    get 'products/show'
  end

  namespace :public do
    resources :cart_items, only: [:index, :update, :create, :destroy]
    #get 'cart_items/index'
    delete 'cart_items/destroy_all'
  end

  namespace :public do
    resources :orders, except: [:edit, :update]
    get 'orders/complete'
    post 'orders/confirm'
    #get 'orders/new'
    #get 'orders/index'
    #get 'orders/show'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
