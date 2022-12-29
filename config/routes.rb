Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #resources :items, only: [:index, :show, :create, :update, :new] #←先行作業：itemsのルーティング
end
