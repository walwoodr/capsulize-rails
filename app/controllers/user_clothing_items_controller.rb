class UserClothingItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    clothing_item = ClothingItem.find(params[:item_id])
    current_user.user_clothing_items.find_or_create_by(clothing_item_id: params[:item_id])
    flash[:message] = "#{clothing_item.name} have been added to your closet"
    redirect_to clothing_items_path
  end
end
