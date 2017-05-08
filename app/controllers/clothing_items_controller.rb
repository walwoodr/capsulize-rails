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
      @clothing_item = ClothingItem.new
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
end
