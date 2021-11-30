Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :update] do
    resources :menus, only: [:index]
    resources :dish_categories, only: [:index] do
      resources :dish, only: [:index]
    end
  end

  root to: "restaurants#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
