class Menu < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true, length: { in: 3..16 }
  validates :price, presence: true, numericality: true
  validates :restaurants_id, presence: true
end
