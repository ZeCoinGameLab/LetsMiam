class AddVoteToUserInvit < ActiveRecord::Migration[6.1]
  def change
    add_column :association_user_invits, :vote, :integer, limit: 4
  end
end
