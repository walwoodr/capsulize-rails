class ClothingItemsController < ApplicationController

    before_action :find_item, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      @clothing_items = current_user.clothing_items
      @categories = Category.all
    end

    def show
    end

    def new
      @clothing_item = ClothingItem.new
    end

    def create
      @clothing_item = ClothingItem.create(clothing_item_params)
      current_user.add_to_closet(@clothing_item)
      flash[:message] = "#{@clothing_item.name} have been added to your closet."
      redirect_to clothing_items_path
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def find_item
      @clothing_item = ClothingItem.find(params[:id])
    end

    def clothing_item_params
      params.require(:clothing_item).permit(:name, :category_id, :color, :fanciness)
    end
end
