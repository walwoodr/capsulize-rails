class OutfitClothingItemsController < ApplicationController

  before_action :authenticate_user!

  def new
    outfit = Outfit.find(params[:outfit_id])
    @clothing_item = outfit.clothing_items.build
    render layout: false
  end

  def create
  end
end
