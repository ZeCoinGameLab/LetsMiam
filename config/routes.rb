Rails.application.routes.draw do

  get 'homepage/index'
  root to: "homepage#index"

  get 'restaurants/best_score', to: 'restaurants#best_score'
  get 'restaurants/discover', to: 'restaurants#discover'
  get 'restaurants/selections', to: 'restaurants#selections'

  resources :restaurants, only: [:index, :show, :update] do
    resources :menus, only: [:index]
    resources :dish_categories, only: [:index] do
      resources :dish, only: [:index]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
