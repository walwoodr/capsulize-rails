Rails.application.routes.draw do

  resources :outfits
  resources :categories
  resources :clothing_items
  resources :users
  root to: 'outfits#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
