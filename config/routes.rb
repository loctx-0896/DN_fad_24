Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    namespace :admin do
      resources :categories
      resources :products
      resources :users
    end
    resources :products
    resources :carts
    resources :orders
    resources :products_detail, only: [:show]
  end
end
