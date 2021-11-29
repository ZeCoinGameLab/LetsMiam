class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, limit: 16
      t.decimal :price, precision: 6, scale: 2
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
