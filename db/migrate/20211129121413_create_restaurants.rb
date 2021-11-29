class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, limit: 24
      t.string :description, limit: 130

      t.timestamps
    end
  end
end
