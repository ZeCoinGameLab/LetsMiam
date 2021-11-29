class CreateDishCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_categories do |t|
      t.string :name, limit: 16
      t.belongs_to :restaurants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
