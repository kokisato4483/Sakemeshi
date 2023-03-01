Rails.application.routes.draw do

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

# ホーム・アバウトページ
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  get "search" => "searches#search"

# 管理者側ルーティング
  namespace :admin do
    resources :genres,only: [:index,:create,:edit,:update,:destroy]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :recipes,only: [:index,:show,:destroy] do
      resources :recipe_comments,only: [:destroy] 
    end
  end

# 会員側ルーティング
  namespace :public do
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    resources :customers,only:[:show] do
      member do
        get :favorites
      end
    end
      
    get 'customers/infomation/quit' => 'customers#quit'
    patch 'customers/infomation/out' => 'customers#out'
    
    resources :recipes,only: [:index,:show,:create,:edit,:update,:destroy,:new] do
      resources :favorites,only: [:create,:destroy]
      resources :recipe_comments,only: [:create,:destroy]
    end
    resources :ingredients,only: [:create,:update,:destroy]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
