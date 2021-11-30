class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :score, :card_photo)
  end

    # def upload
    #   uploaded_file = params[:picture]
    #   File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #     file.write(uploaded_file.read)
    #   end
    # end

end
