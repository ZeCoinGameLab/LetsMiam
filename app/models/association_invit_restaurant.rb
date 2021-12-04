class AssociationInvitRestaurant < ApplicationRecord
  belongs_to :invitation
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :invitation_id, presence: true
end
