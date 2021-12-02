class FoodTagsController < ApplicationController
  def show
    @food_tag = FoodTag.find(params[:id])
  end

  def update
    @food_tags = FoodTag.find(params[:id])

    if @food_tags.update(restaurant_params)
      redirect_to @food_tags
    else
      redirect_to root_path
    end
  end

  def restaurant_params
    params.require(:food_tag).permit(:name, :photo)
  end
end
