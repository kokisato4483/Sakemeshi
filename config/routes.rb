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
    resources :recipes,only: [:index,:show,:destroy] do
      resources :recipe_comments,only: [:destroy] 
    end
  end

  namespace :public do
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    resources :customers,only:[:show]
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
    
    resources :recipes,only: [:index,:show,:create,:edit,:update,:destroy,:new] do
      resources :recipe_comments,only: [:create,:destroy]
    end
    
    resources :ingredients,only: [:create,:update,:destroy]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
end
