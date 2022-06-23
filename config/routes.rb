Rails.application.routes.draw do

  root to: 'public/homes#top'
  get 'public/homes/about' => 'public/homes#about', as: 'about'

  namespace :admin do
    root to: 'homes#top'
    resources :homes, only: [:top]
    resources :orders, only: [:show, :update]
    resources :products
    #get 'products/index'
    #get 'products/new'
    # create追加
    #get 'products/create'
    # get 'products/show'
    #get 'products/edit'
    resources :customers, only: [:index, :show, :edit, :update]
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
    #genresのnew,showを除くルーティング自動生成
    resources :genres, except: [:new, :show]
  end

  namespace :public do
    resources :addresses, except: [:show]
    #get 'addresses/index'
    #get 'addresses/edit'
    resources :customers, except: [:index, :show]
    get  'customers' => 'customers#show', as: 'show'
    # 退会確認画面
    get '/customers/:id/confirm' => 'customers#confirm', as: 'confirm'
    # 論理削除用のルーティング
    patch '/customers/:id/decline' => 'customers#decline', as: 'decline'
    post 'customers/confirm'
    #get 'customers/show'
    #get 'customers/edit'
    # resources :homes, [:about]
    # get 'homes/top'
    # get 'homes/about'
    resources :products, only: [:index, :show]
    # get 'products/index'
    # get 'products/show'
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    #get 'cart_items/index'
    get 'orders/complete' => 'orders#complete'
    resources :orders, except: [:edit, :update]
    post 'orders/confirm' => 'orders#confirm'
    #get 'orders/new'
    #get 'orders/index'
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