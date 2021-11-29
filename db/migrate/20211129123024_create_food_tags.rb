class CreateFoodTags < ActiveRecord::Migration[6.1]
  def change
    create_table :food_tags do |t|
      t.string :name, limit: 24

      t.timestamps
    end
  end
end
