class UserClothingItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    clothing_item = ClothingItem.find(params[:format])
    current_user.add_to_closet(clothing_item)
    flash[:message] = "#{clothing_item.name} have been added to your closet"
    redirect_to clothing_items_path
  end

  def destroy
    clothing_item = ClothingItem.find(params[:id])
    current_user.remove_from_closet(clothing_item)
    flash[:message] = "#{clothing_item.color} #{clothing_item.name} have been removed from your closet"
    redirect_to clothing_items_path
  end
end
