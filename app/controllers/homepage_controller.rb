class HomepageController < ApplicationController
  def index
    @selection_rest = Restaurant.all.take(4)
    @best_rest = Restaurant.where.not(score: nil).order(score: :desc).take(4)
    @discover_rest = Restaurant.where(score: nil).take(4)
    @food_tags = FoodTag.all
  end
end
