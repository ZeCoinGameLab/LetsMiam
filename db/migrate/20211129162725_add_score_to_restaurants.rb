class AddScoreToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :score, :integer, limit: 3
  end
end
