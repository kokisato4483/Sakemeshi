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
  namespace :admin do
    resources :genres,only: [:index,:create,:edit,:update,:destroy]
    resources :customers,only: [:index,:show,:edit,:update]
  end
  
  namespace :admin do
    get 'recipes/index'
    get 'recipes/destroy'
    get 'recipes/show'
    get 'recipes/edit'
    get 'recipes/update'
  end
  
  namespace :public do
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers' => 'customers#show'
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
