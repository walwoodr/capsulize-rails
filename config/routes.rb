Rails.application.routes.draw do

  devise_for :users
  resources :categories
  resources :clothing_items
  resources :users do
    resources :outfits
  end
  root to: 'outfits#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
