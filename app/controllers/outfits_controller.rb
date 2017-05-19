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
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @outfit}
    end
  end

  def new
    @clothing_item = @user.clothing_items.build
    @outfit = @user.outfits.build
    if !@user
      redirect_to new_user_session_path
    end
  end

  def create
    @outfit = @user.outfits.build(outfit_params)
    @clothing_item = @outfit.clothing_items.build(item_params[:clothing_item]) if (item_params[:clothing_item][:name] != "" || item_params[:clothing_item][:color] != "" || item_params[:clothing_item][:category_id] != "")
    if @outfit.save
      redirect_to user_outfit_path(current_user, @outfit)
    else
      @clothing_item ||= @user.clothing_items.build
      render 'new'
    end
  end

  def edit
    @categories = Category.all
    @clothing_item = @outfit.clothing_items.build
  end

  def update
    @outfit.update(outfit_params)
    @clothing_item = @outfit.clothing_items.build(item_params[:clothing_item]) if (item_params[:clothing_item][:name] != "" || item_params[:clothing_item][:color] != "" || item_params[:clothing_item][:category_id] != "")
    if @outfit.save
      redirect_to user_outfit_path(@user, @outfit)
    else
      render 'edit'
    end
  end

  def destroy
    @outfit.delete
    redirect_to user_outfits_path(@user)
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

  def outfit_params
    params.require(:outfit).permit(:user_id, :name, :clothing_item_ids => [])
  end

  def item_params
    params.require(:outfit).permit(clothing_item: [:name, :category_id, :color, :fanciness])
  end

end
