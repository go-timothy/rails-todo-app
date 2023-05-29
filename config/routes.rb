Rails.application.routes.draw do
  devise_for :users
  root "tasks#index"
  resources :tasks

  resources :articles do
    resources :comments
  end
end
