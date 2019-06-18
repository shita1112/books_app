Rails.application.routes.draw do
  root "users#index"

  devise_for :users

  resources :users, only: %i[index edit update] do
    resources :followers, module: :users, only: :index
    resources :followees, module: :users, only: :index
  end

  resources :followings, only: %i[create destroy]

  resources :reports do
    resources :comments, module: :reports
  end

  resources :books do
    resources :comments, module: :books
  end
end
