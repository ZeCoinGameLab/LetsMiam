require 'rails_helper'

RSpec.describe "AssociationInvitRestaurants", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/association_invit_restaurants/new"
      expect(response).to have_http_status(:success)
    end
  end

end
