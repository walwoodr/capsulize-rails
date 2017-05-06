Rails.application.routes.draw do

  root to: 'outfits#index'

  devise_for :users
  resources :categories, only: [:index, :show]
  resources :clothing_items
  resources :users do
    resources :outfits
  end

  get 'user/biggest_closet', to: 'users#biggest_closet'

  get 'home', to: 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
