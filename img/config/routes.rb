Rails.application.routes.draw do
  devise_for :users

  root "images#index"

  resources :images do
    resources :tags, shallow: true
    resources :image_users, shallow: true
  end

end
