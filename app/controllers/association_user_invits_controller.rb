class AssociationUserInvitsController < ApplicationController
  before_action :require_user_logged_in!
  def update
    @association_user_invit = AssociationUserInvit.find(params[:id])
    vote = 0
    association_user_invits_params[:vote].each do |index, byte|
      vote += byte.to_i * 2**index.to_i
    end
    print(vote)
    @association_user_invit.update(vote: vote)

    respond_to do |format|
      format.js { render 'users/my_profile_updated' }
    end
  end

  private

  def association_user_invits_params
    params.require(:association_user_invit).permit(vote: {})
  end
end
