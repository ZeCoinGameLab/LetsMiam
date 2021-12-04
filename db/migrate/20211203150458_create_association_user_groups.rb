class CreateAssociationUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :association_user_groups do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
