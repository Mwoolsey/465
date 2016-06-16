Rails.application.routes.draw do
  resources :professors do
    resources :ratings, shallow: true
  end

  root 'professors#index'
end
