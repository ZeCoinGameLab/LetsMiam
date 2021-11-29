class Dish < ApplicationRecord
  belongs_to :dish_category
  belongs_to :menu, optional: true

  validates :name, presence: true, length: { in: 3..16 }
  validates :details, length: { in: 3..130 }
  validates :price, presence: true, numericality: true
  validates :dish_category_id, presence: true
end
