class Invitation < ApplicationRecord
  has_many :association_user_invits
  has_many :users, :through => :association_user_invits

  has_many :association_invit_restaurants
  has_many :restaurants, :through => :association_invit_restaurants

  belongs_to :group
end
