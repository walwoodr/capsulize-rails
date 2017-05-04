class OutfitsController < ApplicationController

  before_action :find_user
  before_action :find_outfit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if @user
      @outfits = @user.outfits
    else
      redirect_to home_path
    end
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
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif current_user
      @user = current_user
    end
  end

end
