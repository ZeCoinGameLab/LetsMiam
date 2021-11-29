class AssociationUserRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :users_id, presence: true
  validates :restaurants_id, presence: true
end
