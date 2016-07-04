Rails.application.routes.draw do

  devise_for :users
  resources :lists do
    resources :list_recipes, shallow: true
  end
  resources :recipes do
    resources :ingredient_recipes, shallow: true
  end

  resources :ingredients

  root "lists#index"

end
