class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :name
      t.integer :status
      t.belongs_to :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
