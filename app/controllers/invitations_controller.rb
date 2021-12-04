class InvitationsController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @invitation = Invitation.new
    @groups = Group.joins(:association_user_groups).where(association_user_groups: { user_id: Current.user.id })
    if !session[:restaurants_id].blank?
      @restaurants = Restaurant.find(session[:restaurants_id])
    else
      flash[:notice] = 'Vous devez avoir des restaurants ajoutés à l\'invitation pour la valider.
                        Pour se faire, visitez la page d\'accueil ou la page du restaurant en question.'
    end
  end

  def update
    @invitation = Invitation.create(invit_params)
    @restaurants = Restaurant.find(session[:restaurants_id])
    @invitation.restaurants << @restaurants
    @invitation.users = @invitation.group.users
    if @invitation.save
      redirect_to my_profile_url, notice: "Invitation envoyée"
    else
      if !@invitation.blank? && @invitation.errors.any?
        @invitation.errors.each do |error|
          flash[:notice] = error.full_message
        end
      end
      redirect_to new_invitation_path
    end
  end

  def destroy
    @invitation = Invitation.find_by(id: params[:id])
    if @invitation.destroy
      redirect_to my_profile_url, notice: 'Vous avez bien supprimé l\'invitation.'
    else
      redirect_to my_profile_url, notice: 'Erreur lors de la suppression de l\'invitation'
    end
  end

  private

  def invit_params
    params.require(:invitation).permit(:name, :group_id)
  end

end
