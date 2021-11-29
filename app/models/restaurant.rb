class Restaurant < ApplicationRecord
  has_many :menus
  has_many :dish_categories

  has_many :association_food_tag_restaurants
  has_many :food_tags, through: :association_food_tag_restaurants

  has_many :association_user_restaurants
  has_many :users, through: :association_user_restaurants

  validates :name, presence: true, length: { in: 3..24 }
  validates :description, length: { in: 8..130 }
end
