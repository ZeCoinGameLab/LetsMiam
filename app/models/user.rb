class User < ApplicationRecord
  has_secure_password
  has_many :association_user_restaurants
  has_many :restaurants, :through => :association_user_restaurants

  has_many :association_user_groups
  has_many :groups, :through => :association_user_groups

  has_many :association_user_invits
  has_many :invitations, :through => :association_user_invits

  validates :nickname, presence: true, uniqueness: true, length: { in: 2..16 }

end
