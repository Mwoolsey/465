Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  resources :lists do
    resources :list_recipes, shallow: true
  end
  resources :recipes do
    resources :ingredient_recipes, shallow: true
  end

  resources :ingredients

  root "lists#index"

end
