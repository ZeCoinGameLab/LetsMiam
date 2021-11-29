class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name, limit: 16
      t.string :details, limit: 130
      t.decimal :price, precision: 6, scale: 2
      t.belongs_to :dish_categories, null: false, foreign_key: true
      t.belongs_to :menus, null: true, foreign_key: true

      t.timestamps
    end
  end
end
