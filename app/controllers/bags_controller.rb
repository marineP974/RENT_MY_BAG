class BagsController < ApplicationController

  def index
    @bags = Bag.all
  end

  def new
    @user = User.find(params[:user_id])
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = User.find(params[:user_id])
    if @bag.save
      render :show
    else
      render :new
    end
  end

  def show
    @bag = Bag.find(params[:id])
  end

  private

  def bag_params
    params.require(:bag).permit(:title, :price, :description, :brand, :availability, :style, :color, :mood)
  end
end