Rails.application.routes.draw do

  resources :high_scores

  # route to index(landing page)
  root "high_scores#index"

end
