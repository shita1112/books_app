Rails.application.routes.draw do
  devise_for :users

  resources :reports do
    resources :comments, module: :reports
  end

  resources :books do
    resources :comments, module: :books
  end
end
