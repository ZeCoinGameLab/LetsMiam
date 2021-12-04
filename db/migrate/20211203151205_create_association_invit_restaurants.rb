class CreateAssociationInvitRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :association_invit_restaurants do |t|
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.belongs_to :invitation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
