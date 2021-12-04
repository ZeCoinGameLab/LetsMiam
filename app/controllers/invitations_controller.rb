class InvitationsController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @invitation = Invitation.new
    @restaurants = Restaurant.find(session[:restaurants_id])
  end

  def update
    @invitation = Invitation.create(invit_params)
    @restaurants = Restaurant.find(session[:restaurants_id])
    @invitation.restaurants << @restaurants
    @invitation.users = @invitation.group.users
    if @invitation.save
      redirect_to my_profile_url, notice: "Invitation envoyée"
    else
      redirect_to @invitation, alert: "Impossible de créer l'invitation"
    end
  end

  private

  def invit_params
    params.require(:invitation).permit(:name, :group_id)
  end

end
