class CategoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

end
