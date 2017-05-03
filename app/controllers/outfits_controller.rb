class OutfitsController < ApplicationController

  before_action :find_outfit, only: [:show, :edit, :update, :destroy]

  def index
    @outfits = # all outfits of user
  end

  def show
  end

  def new
    @outfit = # new outfit with user
  end

  def create
    @outfit = # new outfit with user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_outfit
    @outfit = Outfit.find(params[:id])
  end
end
