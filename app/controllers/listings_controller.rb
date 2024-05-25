class ListingsController < ApplicationController
  def index
    if params[:search].present?
      @listings = @listings = Listing.where("address ILIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 9)
    else
      @listings = Listing.all.paginate(page: params[:page], per_page: 9)
    end
  rescue StandardError => e
    logger.error "Error loading listings: #{e.message}"
    @listings = []
    flash[:error] = "There was an error loading the listings."
  end

  private

  def search_params
    params.permit(:search, :beds, :baths, :min_price, :max_price, :commit)
  end
end
