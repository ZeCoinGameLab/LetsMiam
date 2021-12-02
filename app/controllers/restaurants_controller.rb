class RestaurantsController < ApplicationController
  def index
    @selection_rest = Restaurant.all.take(4)
    @best_rest = Restaurant.where.not(score: nil).order(score: :desc).take(4)
    @discover_rest = Restaurant.where(score: nil).take(4)
    @food_tags = FoodTag.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      redirect_to root_path
    end
  end

  def food_tag
    @restaurants = Restaurant.joins(:association_food_tag_restaurants).where(association_food_tag_restaurants: { food_tag_id: params[:id] })
    print(@restaurants.inspect)
    @food_tag = FoodTag.find(params[:id])
  end

  def best_score
    @restaurants = Restaurant.where.not(score: nil).order(score: :desc).take(10)
  end

  def discover
    @restaurants = Restaurant.where(score: nil)
  end

  def selections
    @restaurants = Restaurant.all.take(10)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :score, :card_photo)
  end

end
