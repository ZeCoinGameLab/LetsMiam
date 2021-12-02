class FoodTag < ApplicationRecord
  has_many :association_food_tag_restaurants
  has_many :restaurants, :through => :association_food_tag_restaurants
  has_one_attached :photo
  validates :name, presence: true, length: { in: 3..16 }
end
