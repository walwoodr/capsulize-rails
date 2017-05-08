Rails.application.routes.draw do

  root to: 'outfits#index'

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :categories, only: [:index, :show]
  resources :clothing_items
  resources :users do
    resources :outfits
  end
  resources :user_clothing_items, only: [:create, :destroy]
  # post '/user_clothing_items/:item_id', to: 'user_clothing_items#create', as: 'user_clothing_items'
  # delete '/user_clothing_items/:item_id', to: 'user_clothing_items#delete', as: 'user_clothing_items'

  get 'user/biggest_closet', to: 'users#biggest_closet'

  get 'home', to: 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
