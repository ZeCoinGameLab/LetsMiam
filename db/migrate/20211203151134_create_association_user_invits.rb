class CreateAssociationUserInvits < ActiveRecord::Migration[6.1]
  def change
    create_table :association_user_invits do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :invitation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
