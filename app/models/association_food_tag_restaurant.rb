class AssociationFoodTagRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :food_tag

  validates :restaurant_id, presence: true
  validates :food_tag_id, presence: true
end
