class OutfitClothingItemsController < ApplicationController

  before_action :authenticate_user!

  def new
    @outfit = Outfit.find(params[:outfit_id])
    @clothing_item = @outfit.clothing_items.build
    render layout: false
  end

  def create
    @outfit = Outfit.find(params[:outfit_id])
    @clothing_item = @outfit.clothing_items.create(clothing_item_params)
    current_user.add_to_closet(@clothing_item)
    render json: @clothing_item, status: 201
  end

  private

  def clothing_item_params
    params.require(:clothing_item).permit(:color, :name, :category_id, :fanciness)
  end
end
