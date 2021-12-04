class Invitation < ApplicationRecord
  has_many :association_user_invits
  has_many :users, :through => :association_user_invits
  accepts_nested_attributes_for :association_user_invits, allow_destroy: true

  has_many :association_invit_restaurants
  has_many :restaurants, :through => :association_invit_restaurants
  accepts_nested_attributes_for :association_invit_restaurants, allow_destroy: true

  belongs_to :group
  
  validate :invit_restaurants_count
  validates :name, presence: true, length: { in: 3..24 }

  before_destroy do |record|
    AssociationUserInvit.where(invitation_id: record.id).destroy_all
    AssociationInvitRestaurant.where(invitation_id: record.id).destroy_all
  end

  private

  def invit_restaurants_count
    return if association_invit_restaurants.blank?
    errors.add('Too many restaurants') if association_invit_restaurants.size > 3
  end


end
