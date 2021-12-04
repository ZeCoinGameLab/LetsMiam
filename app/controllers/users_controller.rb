class UsersController < ApplicationController
  before_action :require_user_logged_in!
  def show
    @invitations = Invitation.joins(:association_user_invits).where(association_user_invits: { user_id: Current.user.id })
    @groups = Group.joins(:association_user_groups).where(association_user_groups: { user_id: Current.user.id })
    flash[:notice] = 'Vous n\'avez pas de groupe, vous devriez commencer par en créer un.' if @groups.blank?
  end
end
