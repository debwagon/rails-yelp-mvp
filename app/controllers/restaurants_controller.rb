class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :address, :category))
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_path
    end
  end
end
