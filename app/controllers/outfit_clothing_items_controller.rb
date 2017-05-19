class OutfitClothingItemsController < ApplicationController

  before_action :authenticate_user!

  def new
    render partial: 'clothing_items/form', layout: false
  end

  def create
  end
end
