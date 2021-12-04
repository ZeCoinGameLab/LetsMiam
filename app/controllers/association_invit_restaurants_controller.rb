class AssociationInvitRestaurantsController < ApplicationController
  def create

    @invit_rest = AssociationInvitRestaurant.new(invitation_id: session[:invitation_id], restaurant_id: association_invit_rest_params[restaurant_id])
    respond_to do |format|
      if @invit_rest.save
        format.js { render 'restaurants/restaurants_selected' }
      else

      end
    end
  end

  private

  def association_invit_rest_params
    params.require(:association_invit_rest_params).permit(:restaurant_id)
  end

end
