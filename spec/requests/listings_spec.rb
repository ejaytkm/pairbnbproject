require 'rails_helper'

RSpec.describe "Listings", type: :request do
  before :each do 
  		@user = create(:user, email: "hababa@gmail.com", roles: "landlord", password: "harmony123")
  		@user.listings.create!(city: "Metrocity", max_occupants: 8)
  		current_user = @user
  end

  describe "GET /listings" do
    it "get listings" do
    	
      visit listings_path
      page.should have_content("Metrocity")
    end
  end


end
