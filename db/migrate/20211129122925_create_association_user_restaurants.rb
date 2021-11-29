class CreateAssociationUserRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :association_user_restaurants, id: false do |t|
      t.integer :score, limit: 3
      t.string :commentary, limit: 200
      t.belongs_to :users, null: false, foreign_key: true
      t.belongs_to :restaurants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
