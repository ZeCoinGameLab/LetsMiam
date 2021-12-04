class Group < ApplicationRecord
  has_many :association_user_groups
  has_many :users, :through => :association_user_groups

  has_many :invitations

  validates :name, presence: true, length: { in: 3..24 }
end
