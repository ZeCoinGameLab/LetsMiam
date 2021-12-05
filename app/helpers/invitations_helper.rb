module InvitationsHelper
  def check_invitation_without_vote(user_id)
    user = User.find(user_id)
    invitations = Invitation.where(group_id: user.group_ids).select(:id)
    !AssociationUserInvit.where(user_id: user.id, invitation_id: invitations.ids, vote: nil).empty?
  end
end
