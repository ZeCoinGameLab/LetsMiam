class DishCategory < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes

  validates :name, presence: true, length: { in: 3..16 }
  validates :restaurant_id, presence: true
end
