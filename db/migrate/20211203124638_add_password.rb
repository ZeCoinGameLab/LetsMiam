class AddPassword < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :firstname
    rename_column :users, :name, :nickname
    add_index :users, :nickname, :unique => true
  end
end
