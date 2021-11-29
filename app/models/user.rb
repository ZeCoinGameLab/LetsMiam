class User < ApplicationRecord
  has_many :association_user_restaurants
  has_many :restaurants, :through => :association_user_restaurants

  validates :name, presence: true, length: { in: 2..16 }
  validates :firstname, presence: true, length: { in: 2..16 }
end
