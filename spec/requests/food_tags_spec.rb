require 'rails_helper'

RSpec.describe "FoodTags", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/food_tags/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
