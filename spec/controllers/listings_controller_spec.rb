require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  describe "GET #index" do
    context "when there are listings" do
      it "returns a success response" do
        listing = create(:listing)
        get :index
        expect(response).to be_successful
        expect(assigns(:listings)).to eq([listing])
        expect(response).to render_template("index")
      end
    end

    context "with search query present" do
      it "returns http success" do
        get :index, params: { search: "address 123" }
        expect(response).to have_http_status(:success)
      end

      it "correct filtered results" do
        filtered_listings = create_list(:listing, 5, address: "address 123")
        get :index, params: { search: "address 123" }
        expect(assigns(:listings)).to match_array(filtered_listings)
      end
    end

    context "when there is an error" do
      before do
        allow(Listing).to receive(:all).and_raise(StandardError.new("Something went wrong"))
      end

      it "logs the error and sets flash message" do
        expect(Rails.logger).to receive(:error).with("Error loading listings: Something went wrong")
        get :index
        expect(assigns(:listings)).to eq([])
        expect(flash[:error]).to eq("There was an error loading the listings.")
      end
    end
  end
end
