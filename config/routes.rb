Rails.application.routes.draw do
  resources :reports do
    resources :comments, module: :reports
  end

  resources :books do
    resources :comments, module: :books
  end
end
