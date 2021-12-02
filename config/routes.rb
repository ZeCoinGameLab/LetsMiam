Rails.application.routes.draw do

  get 'homepage/index'
  root to: 'homepage#index'

  get 'restaurants/best_score', to: 'restaurants#best_score'
  get 'restaurants/discover', to: 'restaurants#discover'
  get 'restaurants/selections', to: 'restaurants#selections'
  get 'restaurants/food_tag/:id', to: 'restaurants#food_tag'

  resources :restaurants, only: %i[index show update]
  resources :food_tags, only: %i[show update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
