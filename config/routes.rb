Rails.application.routes.draw do

  get 'users/show'
  get 'homepage/index'
  root to: 'homepage#index'

  get 'my_profile', to: 'users#show'
  get 'restaurants/best_score', to: 'restaurants#best_score'
  get 'restaurants/discover', to: 'restaurants#discover'
  get 'restaurants/selections', to: 'restaurants#selections'
  get 'restaurants/food_tag/:id', to: 'restaurants#food_tag'

  resources :restaurants, only: %i[index show update]
  resources :food_tags, only: %i[show update]
  resources :groups, only: [:new, :update] do
    resources :invitations, only: [:new, :show, :update]
  end
  resources :association_user_invits, only: [:update]
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
