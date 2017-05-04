class OutfitsController < ApplicationController

  before_action :find_user
  before_action :find_outfit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @outfits = @user.outfits
  end

  def show
  end

  def new
    @outfit = @user.outfits.build
  end

  def create
    @outfit = @user.outfits.build
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_outfit
    @outfit = @user.outfits.find(params[:id])
  end

  def find_user
    if current_user
      @user = current_user
    else
      @user = User.find(params[:user_id])
    end
  end

end
