class CreateAssociationFoodTagRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :association_food_tag_restaurants, id: false do |t|
      t.belongs_to :restaurants, null: false, foreign_key: true
      t.belongs_to :food_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
