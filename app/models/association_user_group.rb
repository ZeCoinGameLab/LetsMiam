class AssociationUserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :group_id, presence: true
  validates :user_id, presence: true

  after_destroy do |record|
    user_groups = AssociationUserGroup.where(group_id: record.group_id)
    destroy_linked_invitation(record.group_id, record.user_id)
    if user_groups.length == 1
      user_groups.each { |user_group| destroy_linked_invitation(user_group.group_id, user_group.user_id) }
      user_groups.destroy_all
      Invitation.where(group_id: record.group_id).destroy_all
      Group.find(record.group_id).destroy
    end
  end

  private

  def destroy_linked_invitation(group_id, user_id)
    user_invits = AssociationUserInvit.joins(:invitation).where(invitations: { group_id: group_id }, user_id: user_id)
    user_invits.destroy_all
  end
end
