class AssociationUserInvit < ApplicationRecord
  belongs_to :user
  belongs_to :invitation

  validates :invitation_id, presence: true
  validates :user_id, presence: true
end
