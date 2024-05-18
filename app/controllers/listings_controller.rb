class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  rescue StandardError => e
    logger.error "Error loading listings: #{e.message}"
    @listings = []
    flash[:error] = "There was an error loading the listings."
  end
end
