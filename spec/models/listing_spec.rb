require 'rails_helper'

RSpec.describe Listing, type: :model do
  it "is valid with valid attributes" do
    listing = Listing.new(address: "123 Main St", description: "A lovely home", image: "image.jpg")
    expect(listing).to be_valid
  end

  it "is not valid without an address" do
    listing = Listing.new(address: nil, description: "A lovely home", image: "image.jpg")
    expect(listing).to_not be_valid
  end

  it "is not valid without a description" do
    listing = Listing.new(address: "123 Main St", description: nil, image: "image.jpg")
    expect(listing).to_not be_valid
  end

  it "is not valid without an image" do
    listing = Listing.new(address: "123 Main St", description: "A lovely home", image: nil)
    expect(listing).to_not be_valid
  end
end
