class Group < ApplicationRecord
  has_many :association_user_groups
  has_many :users, :through => :association_user_groups

  has_many :invitations
end
